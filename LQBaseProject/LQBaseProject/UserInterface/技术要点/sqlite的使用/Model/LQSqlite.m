//
//  LQSqlite.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/14.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSqlite.h"
#import "LQMacro.h"

@interface LQSqlite ()


@property (copy,  nonatomic) NSString *dataBasePath;
@property (assign, nonatomic) sqlite3 *dataBase;
@end

@implementation LQSqlite

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray * dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * docsDirs = dirPaths.firstObject;
        
        self.dataBasePath = [[NSString alloc]initWithString:[docsDirs stringByAppendingString:@"student.db"]];

    }
    return self;
}

- (void)removeDataBase{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:self.dataBasePath error:nil];
    
}

- (void)createDataBase{


    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:self.dataBasePath]) {
        const char *dbPath =[self.dataBasePath UTF8String];
        
        if (sqlite3_open(dbPath,&_dataBase) == SQLITE_OK) {
            char *errmsg;
            const char *createSql = "CREATE TABLE IF NOT EXISTS studentInfo (ID INTEGER PRIMARY KEY AUTOINCREMENT, NUM TEXT, CLASSNAME TEXT,NAME TEXT)";
            if (sqlite3_exec(_dataBase, createSql, NULL, NULL, &errmsg)!=SQLITE_OK) {
                NSLog(@"******创建  失败  ");
                
            }else{
                NSLog(@"******创建  成功  ");
            }
        }else{
            NSLog(@"******创建或打开  失败  ");
            
        }
    }
    
}

- (void)saveDatawithStudentNum:(NSString *)studentNum withClassName:(NSString *)ClassName withStudentName:(NSString *)studentName{
    sqlite3_stmt *statement;
    const char *dbpath = [self.dataBasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_dataBase)==SQLITE_OK) {

        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO studentInfo (num,classname,name) VALUES(\"%@\",\"%@\",\"%@\")",studentNum,ClassName,studentName];
        const char *insertstaement = [insertSql UTF8String];
        sqlite3_prepare_v2(_dataBase, insertstaement, -1, &statement, NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
           NSLog(@"******保存信息 成功");
        }
        else {
           NSLog(@"******保存信息 失败");
        }
        sqlite3_finalize(statement);
        sqlite3_close(self.dataBase);
    }
}

- (void)searchAllinfo{
    const char *dbpath = [self.dataBasePath UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_dataBase)==SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT ID,classname,name from studentInfo limit 4 "];
        const char *querystatement = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_dataBase, querystatement, -1, &statement, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(statement)==SQLITE_ROW) {
                NSString *ID = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                NSString *classname = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *name = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                NSLog(@"******ID：%@ ****班级 ：%@ ***姓名：%@",ID,classname,name);
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_dataBase);
    }

}

- (void)searchDatawithStudentNum:(NSString *)studentNum{
    const char *dbpath = [self.dataBasePath UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_dataBase)==SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT ID,classname,name from studentInfo where num=%@",studentNum];
        const char *querystatement = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_dataBase, querystatement, -1, &statement, NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_ROW) {
                NSString *ID = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                NSString *classname = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *name = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                NSLog(@"******ID：%@ ****班级 ：%@ ***姓名：%@",ID,classname,name);
            }
            else {
                NSLog(@"******未找到信息");
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_dataBase);
    }
}

- (void)deleteDataWithID:(NSString *)ID{
    const char *dbpath = [self.dataBasePath UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_dataBase)==SQLITE_OK) {
        // ELETE FROM studentInfo WHERE classname = @"" AND ID = @""
        NSString *querySQL = [NSString stringWithFormat:@"DELETE FROM studentInfo WHERE ID = %@ ",ID];
        const char *querystatement = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_dataBase, querystatement, -1, &statement, NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_ROW) {
                NSLog(@"删除成功");
            }
            else {
                NSLog(@"删除失败");
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_dataBase);
    }

}

- (void)updateDataWithStudentNum:(NSString *)studentNum withClassName:(NSString *)ClassName withStudentName:(NSString *)studentName searchID:(NSString *)ID{
    const char *dbpath = [self.dataBasePath UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_dataBase)==SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"UPDATE studentInfo SET num = %@,classname = %@, name = %@ WHERE id = %@",studentNum,ClassName,studentName,ID];
        const char *querystatement = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_dataBase, querystatement, -1, &statement, NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_ROW) {
                NSLog(@"******更新成功");
            }
            else {
                NSLog(@"******更新失败");
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_dataBase);
    }

}

@end
