//
//  MVPSampleAppTests.m
//  MVPSampleAppTests
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Utility.h"

#define MaxNumberOfWords 3

#define NAME_OUT_OF_LIMIT_MSG       @"Word count in name is exceeding the limit"
#define EMAIL_INVALID_MSG           @"Email is not valid"
#define EMAIL_NOT_IN_LOWERCASE_MSG  @"Email is not in lowercase as expected"

@interface MVPSUserInfoTest : XCTestCase

@end

@implementation MVPSUserInfoTest

#pragma mark - Set up test

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp
{
    [super setUp];
}

// Put teardown code here. This method is called after the invocation of each test method in the class.
- (void)tearDown
{
    [super tearDown];
}

#pragma mark End

#pragma mark - Performance test

// This is an example of a performance test case.
- (void)testPerformanceExample
{
    [self measureBlock:^
    {
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark End

- (void) testNameWordLimit
{
    XCTAssertEqualObjects([Utility shortenOrTruncateText:@"quo vero reiciendis velit similique earum" toWordCount:3], @"quo vero reiciendis...", "Name exceeding word limit");
}

- (void) testNameWordLimitExceed
{
    XCTAssertEqualObjects(@"quo vero reiciendis velit similique earum", @"quo vero reiciendis...", "Name exceeding word limit");
}

- (void) testEmailValidity
{
    XCTAssertTrue([Utility isValidEmailID:@"Eliseo@gardner.biz"], @"Email is not valid");
}

- (void) testEmailValidityEmptyText
{
    XCTAssertTrue([Utility isValidEmailID:@" "], @"Email is not valid. Email id empty");
}

- (void) testEmailValiditymissingCharacter
{
    XCTAssertTrue([Utility isValidEmailID:@"Eliseogardner.biz"], @"Email is not valid, Missing @ character.");
}

- (void) testEmailAlphabetCase
{
    NSString * email = @"Eliseo@gardner.biz";
    
    XCTAssertEqualObjects([Utility lowerCaseTextFromText:email], @"eliseo@gardner.biz", "Email is not in lowercase as expected");
}

- (void) testEmailWrongAlphabetCase
{
    NSString * email = @"Eliseo@gardner.biz";
    
    XCTAssertEqualObjects(email, @"eliseo@gardner.biz", "Email is not in lowercase as expected");
}

@end
