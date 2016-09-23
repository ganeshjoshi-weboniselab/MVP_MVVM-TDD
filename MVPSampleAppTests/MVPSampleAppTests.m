//
//  MVPSampleAppTests.m
//  MVPSampleAppTests
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MVPSUserInfoPresenter.h"
#import "MVPSUserInfo.h"
#import "MVPSUserInfo+View.h"
#import "Utility.h"

#define MaxNumberOfWords 3

#define NAME_OUT_OF_LIMIT_MSG       @"Word count in name is exceeding the limit"
#define EMAIL_INVALID_MSG           @"Email is not valid"
#define EMAIL_NOT_IN_LOWERCASE_MSG  @"Email is not in lowercase as expected"

@interface MVPSampleAppTests : XCTestCase
{
    MVPSUserInfoPresenter *_presenter;
}
@end

@implementation MVPSampleAppTests

#pragma mark - Set up test

// Put setup code here. This method is called before the invocation of each test method in the class.
- (void)setUp
{
    [super setUp];
    
    _presenter = [[MVPSUserInfoPresenter alloc] initWithDelegate:self];
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
        
        for(MVPSUserInfo *user in _presenter.userinfoList)
        {
            [user nameWithThreeWords];
        }
    }];
}

#pragma mark End

- (void) testNameWordLimit
{
    for(MVPSUserInfo *user in _presenter.userinfoList)
    {
        NSArray * nameComponents = [[user nameWithThreeWords] componentsSeparatedByString:@" "];
        
        XCTAssertTrue(nameComponents.count <= MaxNumberOfWords, NAME_OUT_OF_LIMIT_MSG);
    }
}

- (void) testEmailValidity
{
    for(MVPSUserInfo *user in _presenter.userinfoList)
    {
        XCTAssertTrue([Utility isValidEmailID:[user emailID]], EMAIL_INVALID_MSG);
    }
    
    //TODO::Uncomment to test failure of test
   /* XCTAssertTrue([Utility isValidEmailID:@"ganesh.joshi@.com"], @"Email is not valid"); */
}

- (void) testEmailAlphabetCase
{
    for(MVPSUserInfo *user in _presenter.userinfoList)
    {
        NSString *email = [user emailInLowerCase];
        
        NSCharacterSet *notAllowedChars = [[NSCharacterSet letterCharacterSet] invertedSet];
        NSString *resultString = [[email componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        
        email = [resultString stringByTrimmingCharactersInSet:[NSCharacterSet lowercaseLetterCharacterSet]];
        
        XCTAssertTrue(email.length == 0, EMAIL_NOT_IN_LOWERCASE_MSG);
    }

    //TODO::Uncomment to test failure of test
    /*
    NSString * email = @"ganesh.joshi@weboniselab.com";
    XCTAssertEqualObjects([Utility lowerCaseTextFromText:@""], email, "Email is not in lowercase as expected");
     */
}

@end
