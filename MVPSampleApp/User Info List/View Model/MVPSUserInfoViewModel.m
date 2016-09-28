//
//  MVPSUserInfoViewModel.m
//  MVPSampleApp
//
//  Created by webonise on 27/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfoViewModel.h"
#import "Utility.h"
#import "MVPSUserInfo.h"
#import "MVPSUserInfo+View.h"

@implementation MVPSUserInfoViewModel

- (NSArray *) loadUserInfoFromRespnose:(NSArray *) allUserInfoList
{
    NSMutableArray * userInfoList = [NSMutableArray new];
    
    for(NSDictionary *userInfoResponse in allUserInfoList)
    {
        MVPSUserInfo * userInfo = [MVPSUserInfo new];
        
        [userInfo loadUserInfo:userInfoResponse];
        
        [userInfoList addObject:userInfo];
    }
    
    return [userInfoList count] ? userInfoList : nil;
}


@end
