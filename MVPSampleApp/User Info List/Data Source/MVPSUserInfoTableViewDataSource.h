//
//  MVPSUserInfoTableViewDataSource.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MVPSUserInfoTableViewDataSource : NSObject <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSArray * userInfoList;

- (id)initWithUserInfoList: (NSArray *) userInfoList;

@end
