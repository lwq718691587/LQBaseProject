//
//  LQBaseProjectTests.m
//  LQBaseProjectTests
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

//
//XCTFail(format…)  //生成一个失败的测试；
//XCTAssertNil(a1, format...)  //为空判断，a1为空时通过，反之不通过；
//XCTAssertNotNil(a1, format…) //不为空判断，a1不为空时通过，反之不通过；
//XCTAssert(expression, format...) //当expression求值为TRUE时通过；
//XCTAssertTrue(expression, format...) //当expression求值为TRUE时通过；
//XCTAssertFalse(expression, format...)  //当expression求值为False时通过；
//XCTAssertEqualObjects(a1, a2, format...)  //判断相等，[a1 isEqual:a2]值为TRUE时通过，其中一个不为空时，不通过；
//XCTAssertNotEqualObjects(a1, a2, format...)  //判断不等，[a1 isEqual:a2]值为False时通过；
//XCTAssertEqual(a1, a2, format...)  //判断相等（当a1和a2是 C语言标量、结构体或联合体时使用,实际测试发现NSString也可以）；
//XCTAssertNotEqual(a1, a2, format...)  //判断不等（当a1和a2是 C语言标量、结构体或联合体时使用）；
//XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...)  //判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/-accuracy）以内相等时通过测试；
//XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...)   //判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
//XCTAssertThrows(expression, format...)  //异常测试，当expression发生异常时通过；反之不通过；
//XCTAssertThrowsSpecific(expression, specificException, format...)  //异常测试，当expression发生specificException异常时通过；反之发生其他异常或不发生异常均不通过；
//XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...)  //异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
//XCTAssertNoThrow(expression, format…)  //异常测试，当expression没有发生异常时通过测试；
//XCTAssertNoThrowSpecific(expression, specificException, format...)  //异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
//XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...)  //异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过


/*很多时候，我们的项目中难免发生多个类之间的交互处理，而这种操作非常的不好调试。单元测试的原则之一就在于我们用来测试的代码要求功能很单一，这其实与良好的代码设计的思想是非常相符的。一方面来说，良好的代码结构设计可以让我们的测试用例的构建更加快速简单；反过来单元测试逼着我们去想办法减少类之间的耦合以此来减少甚至排除测试的干扰。无论如何，如果你想成为更好的开发者，单元测试是我们快速提升代码认知的重要手段之一。
*/
#import <XCTest/XCTest.h>
#import "NSString+LQAddition.h"
#import "LQSqlite.h"
@interface LQBaseProjectTests : XCTestCase

@end

@implementation LQBaseProjectTests

- (void)setUp {
    [super setUp];
    //每个test方法执行前调用，在这个测试用例里进行一些通用的初始化工作
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    

    
    
 
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
   
    }];
}

@end
