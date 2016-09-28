//
//  MVPSUserInfoPresenter.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MVPSUserInfoPresenterDelegate <NSObject>

- (void) didFinishLoadingUserInfoList:(NSArray *) userInfoList;

@end

@interface MVPSUserInfoPresenter : NSObject

- (instancetype)initWithDelegate:(id)delegate;

@property id delegate;

@property (nonatomic, strong) NSArray *userinfoList;

@end