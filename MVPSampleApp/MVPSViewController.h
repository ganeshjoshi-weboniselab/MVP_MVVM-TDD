//
//  ViewController.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MVPSUserInfoTableViewDataSource;

@interface MVPSViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *tblUserInfoList;

@property (nonatomic, strong) MVPSUserInfoTableViewDataSource * dataSource;

@end

