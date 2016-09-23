//
//  ViewController.m
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSViewController.h"
#import "MVPSUserInfoTableViewDataSource.h"
#import "MVPSUserInfoTableViewCell.h"
#import "MVPSUserInfoPresenter.h"

@interface MVPSViewController ()
{
    MVPSUserInfoPresenter *_presenter;
    
    NSArray *_userInfoList;
}
@end

@implementation MVPSViewController

#pragma mark - Internal methods

- (void) confifureTableViewDataSourceWithUserInfoList:(NSArray *)userInfoList
{
    _dataSource = [[MVPSUserInfoTableViewDataSource alloc] initWithUserInfoList:userInfoList];
        
    self.tblUserInfoList.dataSource = _dataSource;
    self.tblUserInfoList.delegate   = _dataSource;
    
    [self performSelectorOnMainThread:@selector(updateList) withObject:self waitUntilDone:NO];
}

- (void) updateList
{
    [self.tblUserInfoList reloadData];
}
- (void) setPresenter
{
    MVPSUserInfoPresenter * presenter = [[MVPSUserInfoPresenter alloc] initWithDelegate:self];
    _presenter = presenter;
}

#pragma mark End

#pragma mark - ViewController life cycle

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self setPresenter];
}

#pragma mark End

#pragma mark - Presenter delegate methods

- (void) didFinishLoadingUserInfoList:(NSArray *) userInfoList
{
    [self confifureTableViewDataSourceWithUserInfoList:userInfoList];
}

#pragma mark End

#pragma mark - Memory

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark End

@end
