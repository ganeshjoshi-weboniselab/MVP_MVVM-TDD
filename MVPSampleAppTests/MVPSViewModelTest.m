//
//  MVPSViewModelTest.m
//  MVPSampleApp
//
//  Created by webonise on 27/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MVPSUserInfoViewModel.h"
#import "Utility.h"

#define FileName @"UserInfo"

@interface MVPSViewModelTest : XCTestCase

@end

@implementation MVPSViewModelTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUserInfoViewModel
{
    MVPSUserInfoViewModel *userInfoViewModel = [MVPSUserInfoViewModel new];
    
    XCTAssertNotNil([userInfoViewModel loadUserInfoFromRespnose:[Utility getJsonFromFile:FileName]], @"Failed to parse user info");
}

- (void)testUserInfoViewModelNoResponse
{
    MVPSUserInfoViewModel *userInfoViewModel = [MVPSUserInfoViewModel new];
    
    XCTAssertNotNil([userInfoViewModel loadUserInfoFromRespnose:nil], @"Failed to parse user info");
}


- (void)testPerformanceExample
{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
