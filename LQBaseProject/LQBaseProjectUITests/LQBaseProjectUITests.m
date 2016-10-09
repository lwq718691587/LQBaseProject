//
//  LQBaseProjectUITests.m
//  LQBaseProjectUITests
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface LQBaseProjectUITests : XCTestCase

@end

@implementation LQBaseProjectUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.staticTexts[@"MVVM"] tap];
    
    XCUIElement *element = [[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"123"];
    
    [textField typeText:@"  "];
    
    [[app.windows elementAtIndex:0] pressForDuration:5];

    
}
- (void)testMVVM_RAC{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.staticTexts[@"runtime"] tap];
    
    XCUIElement *button = app.navigationBars.buttons[@"功能"];
    [button tap];
    [tablesQuery.staticTexts[@"KVO"] tap];
    [button tap];
    
}
@end
