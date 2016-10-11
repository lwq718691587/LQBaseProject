//
//  UserEntity.m
//  NARUTO
//
//  Created by 刘伟强 on 15/4/18.
//  Copyright (c) 2015年 刘伟强. All rights reserved.
//

#import "UserEntity.h"

@implementation UserEntity

-(id) initWithFMDB:(FMDatabase *)database{
    self = [super initWithFMDB:database];
    if(self){
        //给表名赋值
        self.tableName = @"userList";
        //字段列表
        self.fields = @[@"id", @"userName", @"userPassword",@"timestamp", @"done"];
        //主键的ID
        //self.primaryField = @"id";
        [self setDefault];
    }
    return self;
}

//设置默认数据
-(void) setDefault{
    //清除数据
    self.ID = NSNotFound;
    self.userName = nil;
    self.userPassword = nil;
    self.timestamp = nil;
}

//获取所有字段存到数据库的值
-(NSArray *) parameters{
    return @[[PeakSqlite nilFilter:self.userName],
             [PeakSqlite nilFilter:self.userPassword],
             [PeakSqlite dateToValue: self.timestamp],
             [NSNumber numberWithBool: self.done],
             [NSNumber numberWithInt: (int)self.ID]];
}

//插入数据
-(NSInteger)insert{
    NSString *sql = @"INSERT INTO userList(%@) VALUES (%@)";
    NSString *insertFields = @"userName, userPassword, timestamp, done";
    NSString *insertValues = @"?,?,?,?";
    NSLog(@"%ld", (long)self.ID);
    //没有指定ID
    if(self.ID != NSNotFound){
        insertFields = [insertFields stringByAppendingString: @", id"];
        insertValues = [insertValues stringByAppendingString: @", ?"];
    }
    sql = [NSString stringWithFormat: sql, insertFields, insertValues];
    self.ID =[self insertWithSql:sql parameters: [self parameters]];
    return [self insertWithSql:sql parameters: [self parameters]];
}

//更新数据
-(BOOL)update{
    NSString *sql = @"UPDATE userList SET userName = ?,userPassword = ?, timestamp = ?, done = ? WHERE id = ?";
    [self.database open];
    
    [self.database executeUpdate:sql withArgumentsInArray:[self parameters]];
    NSLog(@"%@",[self parameters]);
    BOOL result = [self.database executeUpdate:sql withArgumentsInArray: [self parameters]];
    [self.database close];
    
    return result;
}

//转换字典到当前实例
-(void)parseFromDictionary: (NSDictionary *) data{
    self.data = data;
    self.ID = [[data objectForKey:@"id"] intValue];
    
    self.timestamp = [PeakSqlite valueToDate: [data objectForKey:@"timestamp"]];
    self.done = [[data objectForKey:@"done"] boolValue];
    self.userName  = [PeakSqlite valueToString: [data objectForKey:@"userName"]];
    self.userPassword  = [PeakSqlite valueToString: [data objectForKey:@"userPassword"]];
}

//获取一条数据
-(BOOL) findOneWithCondition:(NSString *)cond parameters:(NSArray *)params orderBy:(NSString *)orderBy{
    BOOL result = [super findOneWithCondition:cond parameters:params orderBy:orderBy];
    //将数据填充到属性
    if(result){
        [self parseFromDictionary: self.data];
    }else{
        //没有找到数据，还原为初始值
        [self setDefault];
    }
    return result;
}

//==================获取字段名及表名==================
//获取所有的字段名称
+(NSArray *) fields{
    return @[@"id", @"userName",@"userPassword" ,@"timestamp", @"done"];
}

//获取表名
+(NSString*)tableName{
    return @"userList";
}

//字段名：id
+(NSString*)ID{
    return @"id";
}

//字段名： timestamp
+(NSString*)timestamp{
    return @"timestamp";
}

//字段名：userName
+(NSString*)userName{
    return @"userName";
}
//字段名：userPassword
+(NSString*)userPassword{
    return @"userPassword";
}
//字段名：done
+(NSString*)done{
    return @"done";
}

//创建数据库的sql语句
+(NSString *) sqlForCreateTable{
    //注意，日期类型在sqlite中不支持，所以日期类型会被转换为float类型
    return @"CREATE TABLE if not exists userList(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, timestamp FLOAT, done boolean, userName TEXT,userPassword TEXT)";
}
@end

