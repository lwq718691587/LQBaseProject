//
//  LQSqlite.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/14.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface LQSqlite : NSObject


- (void)createDataBase;

- (void)removeDataBase;

- (void)saveDatawithStudentNum:(NSString *)studentNum withClassName:(NSString *)ClassName withStudentName:(NSString *)studentName;

- (void)searchDatawithStudentNum:(NSString *)studentNum;

- (void)searchAllinfo;

- (void)deleteDataWithID:(NSString *)ID;

- (void)updateDataWithStudentNum:(NSString *)studentNum withClassName:(NSString *)ClassName withStudentName:(NSString *)studentName searchID:(NSString *)ID;

@end
