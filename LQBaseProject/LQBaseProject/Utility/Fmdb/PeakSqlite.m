//
//  PeakSqliteEntity.m
//  PeakSqlite-Samples
//
//  Created by conis on 8/21/13.
//  Copyright (c) 2013 conis. All rights reserved.
//

#import "PeakSqlite.h"

@implementation PeakSqlite

//初始化
-(id) initWithFMDB:(FMDatabase *)database{
  self = [super init];
  if(self){
    self.primaryId = NSNotFound;
    self.primaryField = @"id";
    self.database = database;
  }
  return self;
}

//计算根据Sql计算分页信息
-(PeakPagination) paginationWithSql: (NSString *) sql parameters:(NSArray *)params pageIndex: (NSInteger) aIndex pageSize: (NSInteger) aSize
{
  PeakPagination pag;
  pag.pageSize = aSize;
  
  
  pag.recordCount = [self countWithSql:sql parameters:params];
  pag.pageCount =  ceil(pag.recordCount / aSize);
  pag.pageIndex = MAX(0, MIN(aIndex, pag.pageCount));
  
  //计算startIndex和endIndex
  //pag.startIndex = pag.pageIndex <= 1 ? 0 : pag.pageIndex * pag.pageSize - pag.pageSize;
  pag.startIndex = pag.pageIndex * pag.pageSize;
  pag.endIndex = pag.pageSize;
  return pag;
}

//根据条件对当前表进行分页计算
-(PeakPagination) paginationWithCondition: (NSString *) cond parameters: (NSArray *) params pageIndex: (NSInteger) aIndex pageSize: (NSInteger) aSize{
  NSString *sql = [NSString stringWithFormat:
                   @"SELECT COUNT(%@) FROM %@ WHERE 1 = 1 %@",
                   self.primaryField,
                   self.tableName,
                   [PeakSqlite getString: cond]];
  return [self paginationWithSql:sql parameters:params pageIndex:aIndex pageSize:aSize];
}


-(void)parseFromDictionary: (NSDictionary *) data{

}
#pragma mark 增删改

//根据主键删除
-(BOOL) deleteWithPrimary:(NSInteger)primaryId
{
  NSString *condition = [NSString stringWithFormat: @" AND %@ = %ld", self.primaryField, primaryId];
  return [self deleteWithCondition:condition parameters:nil];
}

//根据条件删除某个表的数据
-(BOOL) deleteWithCondition:(NSString *)cond parameters:(NSArray *)params
{
  NSString *sql = [NSString stringWithFormat: @"DELETE FROM %@ WHERE 1 = 1%@",
                   self.tableName,
                   [PeakSqlite getString: cond]];
  [self.database open];
  BOOL result = [self.database executeUpdate:sql withArgumentsInArray:params];
  [self.database close];
  return result;
}

//插入或者更新数据，根据ID来判断
-(BOOL) save{
  //插入
  if (self.primaryId == NSNotFound) {
    return [self insert] != NSNotFound;
  };
  
  //更新
  return [self update];
}

//插入当前实例，并返回最后插入的ID
-(BOOL) update{
  NSLog(@"子类必需实现此方法");
  return NO;
}

//更新数据
-(NSInteger) insert{
  NSLog(@"子类必需实现此方法");
  return NSNotFound;
}

//插入数据，并返回最后插入的ID
-(NSInteger) insertWithSql:(NSString *)sql parameters:(NSArray *)params
{
  NSInteger lastId = -1;
  [self.database open];
  if([self.database executeUpdate:sql withArgumentsInArray:params]){
    lastId = [self.database lastInsertRowId];
  }
  [self.database close];
  return lastId;
}

#pragma makr 获取数据
//获取第一行第一列的数据
-(id) scalarWithSql:(NSString *)sql parameters:(NSArray *)params
{
  id result = nil;
  [self.database open];
  FMResultSet *rs = [self.database executeQuery:sql withArgumentsInArray:params];
  
  //读取第一条数据
  while ([rs next]) {
    result = [rs objectForColumnIndex:0];
    break;
  }
  [rs close];
  [self.database close];
  return result;
}

//根据Sql来计算总记录数
-(NSInteger)countWithSql:(NSString *)sql parameters:(NSArray *)params
{
  return [[self scalarWithSql:sql parameters:params] intValue];
}

//根据条件计算当前表
-(NSInteger) countWithCondition:(NSString *)cond parameters:(NSArray *)params
{
  NSString *sql = [NSString stringWithFormat:
                   @"SELECT COUNT(%@) total FROM %@ WHERE 1 = 1 %@",
                   self.primaryField,
                   self.tableName,
                   [PeakSqlite getString: cond]];
  return [self countWithSql:sql parameters:params];
}

//根据条件统计当前表的某一个字段
-(CGFloat) sumWithCondition: (NSString *) cond field: (NSString *) field parameters:(NSArray *)params{
  NSString *sql = [NSString stringWithFormat:
                   @"SELECT sum(%@) total FROM %@ WHERE 1 = 1 %@",
                   field,
                   self.tableName,
                   [PeakSqlite getString: cond]];
  return [self sumWithSql:sql parameters:params];
}

//根据sql统计，要求sql的第一列必需是sum(field)
-(CGFloat) sumWithSql: (NSString *) sql parameters:(NSArray *)params{
  id result = [self scalarWithSql:sql parameters:params];
  return  [PeakSqlite isDBNull: result] ? 0 : [result floatValue];
}

//获取一条记录
-(BOOL) findOneWithCondition:(NSString *)cond parameters:(NSArray *)params orderBy:(NSString *)orderBy
{
  NSString *fields = [self.fields componentsJoinedByString:@","];
  NSString *sql = [NSString stringWithFormat:
                   @"SELECT %@ FROM %@ WHERE 1 = 1 %@ %@ LIMIT 1",
                   fields,
                   self.tableName,
                   [PeakSqlite getString: cond],
                   [PeakSqlite getString: orderBy]];
  
  //sql = [sql stringByAppendingString: cond];
  //if(orderBy != nil) sql = [sql stringByAppendingFormat:@" ORDER BY %@", sort];
  //sql = [sql stringByAppendingString: @" LIMIT 1"];
  
  FMResultSet *rs = [self.database executeQuery:sql withArgumentsInArray: params];
  self.data = rs.resultDictionary;
  [rs close];
  [self.database close];
  return self.data != nil;
}

//根据主键，获取一条记录
-(BOOL)findOneWithPrimaryId:(NSInteger) primaryId{
  NSString *cond = [NSString stringWithFormat: @" AND %@ = %ld", self.primaryField, (long)primaryId];
  return [self findOneWithCondition:cond parameters:nil orderBy:nil];
}

//子类重载实现数据填充
-(BOOL) findOneWithFMResultSet:(FMResultSet *)rs{
  NSLog(@"子类必需实现此方法");
  return NO;
}

//根据Sql搜索，并返回结果集
-(NSArray *) findWithSql:(NSString *)sql parameters:(NSArray *)params{
  NSMutableArray *result = [[NSMutableArray alloc] init];
  [self.database open];
    
  FMResultSet *rs = [self.database executeQuery:sql withArgumentsInArray:params];
  while ([rs next]) {
    [result addObject: [rs resultDictionary]];
  };
  [rs close];
  [self.database close];
  return [NSArray arrayWithArray: result];
}

//根据sql查询数据，并可以设置起止范围
-(NSArray *) findWithSql: (NSString *) sql parameters:(NSArray *)params startIndex: (NSInteger) start endIndex: (NSInteger) end{
  sql = [sql stringByAppendingFormat:@" LIMIT %ld, %ld", (long)start, (long)end];
    
    
    
    
  return [self findWithSql:sql parameters:params];
}

//根据条件查询当前表
-(NSArray *) findWithCondition: (NSString *) cond parameters:(NSArray *)params orderBy:(NSString *)orderBy
{
  //获取所有记录
  return [self findWithCondition:cond parameters:params orderBy:orderBy startIndex:0 endIndex:NSIntegerMax];
}

//根据条件查询，可以进行分页
-(NSArray *) findWithCondition: (NSString *) cond parameters:(NSArray *)params orderBy:(NSString *)orderBy startIndex: (NSInteger) start endIndex: (NSInteger) end{
  NSString *fields = [self.fields componentsJoinedByString: @","];
  NSString *sql = [NSString stringWithFormat:
                   @"SELECT %@ FROM %@ WHERE 1 = 1  %@ %@",
                   fields,
                   self.tableName,
                   [PeakSqlite getString: cond],
                   [PeakSqlite getString: orderBy]];
    // 1=1
  return [self findWithSql:sql parameters:params startIndex:start endIndex:end];
}

//获取当前表的所有数据
-(NSArray *) findAllWithOrderBy: (NSString *) orderBy{
  return [self findAllWithOrderBy:orderBy startIndex:0 endIndex:NSIntegerMax];
}

//查询所有数据，并可以分页
-(NSArray *) findAllWithOrderBy: (NSString *) orderBy startIndex: (NSInteger) start endIndex: (NSInteger) end{
  return [self findWithCondition:nil parameters:nil orderBy:orderBy startIndex:start endIndex:end];
}

#pragma mark 类方法
//获取字符串，如果是nil，则返回一个空字符串 
+(NSString *) getString: (NSString *) text{
  return text == nil ? @"" : text;
}

//将nil转换为NSNull null，主要针对指针类型
+(id) nilFilter: (id) value{
  return value == nil ? [NSNull null] : value;
}

//是否为数据库中的空值
+(BOOL) isDBNull:(id)value{
  return value == [NSNull null];
}

//将数据库值转为字符，防止出现NSNull
+(NSString *) valueToString:(id)value{
  return [self isDBNull: value] ? nil : value;
}

//将数据库中的值转换为日期
+(NSDate*) valueToDate:(id)value
{
    
    
  if([self isDBNull: value]) return nil;
  //如果是数字的话，则使用dateWithTimeIntervalSince1970转换
  if([value isMemberOfClass:[NSNumber class]]){
    return [NSDate dateWithTimeIntervalSince1970: [value doubleValue]];
  }else if([value isMemberOfClass:[NSString class]]){
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    return [dateFormatter dateFromString: value];
  }
  
  return nil;
}

//将日期转换为数字，因为sqlite不支持数据库
+(id) dateToValue: (NSDate *) date{
  if(date == nil) return [NSNull null];
  return  [NSNumber numberWithFloat: [date timeIntervalSince1970]];
}

+(NSString *) sqlForCreateTable{
  return nil;
}
@end
