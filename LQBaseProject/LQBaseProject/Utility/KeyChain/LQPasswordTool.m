//
//  LQPasswordTool.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQPasswordTool.h"
#import "LQKeychainTool.h"
@implementation LQPasswordTool

static NSString * const KEY_IN_KEYCHAIN = @"com.Oracleen.app.userinfo";
static NSString * const KEY_USERNAME = @"com.Oracleen.app.username";
static NSString * const KEY_PASSWORD = @"com.Oracleen.app.password";


+ (void)saveUserName:(id)userName passWord:(id)password
{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    
    [usernamepasswordKVPairs setObject:userName forKey:KEY_USERNAME];
    [usernamepasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    
    [LQKeychainTool save:KEY_IN_KEYCHAIN data:usernamepasswordKVPairs];
    
}

+ (id)readPassWord
{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[LQKeychainTool load:KEY_IN_KEYCHAIN];
    
    return [usernamepasswordKVPair objectForKey:KEY_PASSWORD];
}

+ (id)readUserName
{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[LQKeychainTool load:KEY_IN_KEYCHAIN];
    
    return [usernamepasswordKVPair objectForKey:KEY_USERNAME];
}

+ (void)deletePassWord
{
    [LQKeychainTool delete:KEY_IN_KEYCHAIN];
}

@end
