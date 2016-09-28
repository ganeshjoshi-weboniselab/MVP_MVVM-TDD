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
#import "MVPSUserInfoViewModel.h"

#define FileName @"UserInfo"

@interface MVPSUserInfoPresenter ()
{
    MVPSUserInfoViewModel *_userInfoViewModel;
}
@end

@implementation MVPSUserInfoPresenter

@synthesize delegate;

- (instancetype)initWithDelegate:(id)_delegate
{
    self = [super init];
    
    if (self)
    {
        self.delegate = _delegate;
        
        [self setUpViewModelAndGetUserInfoList];
    }
    
    return self;
}

#pragma mark - Parse user info

- (void) setUpViewModelAndGetUserInfoList
{
    _userInfoViewModel  = [MVPSUserInfoViewModel new];
    _userinfoList       =  [_userInfoViewModel loadUserInfoFromRespnose:[Utility getJsonFromFile:FileName]];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(didFinishLoadingUserInfoList:)])
        [self.delegate didFinishLoadingUserInfoList:_userinfoList];
}

#pragma mark End

@end
