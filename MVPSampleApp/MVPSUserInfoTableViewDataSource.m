//
//  MVPSUserInfoTableViewDataSource.m
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfoTableViewDataSource.h"
#import "MVPSUserInfoTableViewCell.h"

@implementation MVPSUserInfoTableViewDataSource

#define CELL_IDENTIFIER @"MVPSUserInfoTableViewCell"

#pragma mark - Initilization

- (id)initWithUserInfoList: (NSArray *) userInfoList
{
    self = [super init];
    
    if (self)
    {
        self.userInfoList = userInfoList;
    }
    
    return self;
}

#pragma mark End

#pragma mark - TableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_userInfoList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MVPSUserInfoTableViewCell getHeightForCellForUerInfo:[self.userInfoList objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVPSUserInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    [cell setUserInfo: [_userInfoList objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark End

@end
