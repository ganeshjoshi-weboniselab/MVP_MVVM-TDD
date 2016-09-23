//
//  MVPSUserInfoPresenter.m
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfoPresenter.h"
#import "Utility.h"
#import "MVPSUserInfo.h"
#import "MVPSUserInfo+View.h"

#define FileName @"UserInfo"

@implementation MVPSUserInfoPresenter

@synthesize delegate;

- (instancetype)initWithDelegate:(id)_delegate
{
    self = [super init];
    
    if (self)
    {
        self.delegate = _delegate;
        
        [self getAndParseUserInfo];
    }
    
    return self;
}

#pragma mark - Parse user info

- (void) getAndParseUserInfo
{
    NSArray * allUserInfoList = [Utility getJsonFromFile:FileName];
    
    NSMutableArray * userInfoList = [NSMutableArray new];
    
    for(NSDictionary *userInfoResponse in allUserInfoList)
    {
        MVPSUserInfo * userInfo = [MVPSUserInfo new];
        
        [userInfo loadUserInfo:userInfoResponse];
        
        [userInfoList addObject:userInfo];
    }
    
    [self finishLoadingUserInfo:userInfoList];
}

- (void) finishLoadingUserInfo:(NSArray *)userInfoList
{
    _userinfoList = userInfoList;
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(didFinishLoadingUserInfoList:)])
        [self.delegate didFinishLoadingUserInfoList:userInfoList];
}

#pragma mark End

@end
