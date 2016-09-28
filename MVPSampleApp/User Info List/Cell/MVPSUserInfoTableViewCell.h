//
//  MVPSUserInfoTableViewCell.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MVPSUserInfo;

@interface MVPSUserInfoTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel * lblName;
@property (nonatomic, weak) IBOutlet UILabel * lblEmailID;
@property (nonatomic, weak) IBOutlet UILabel * lblBody;

@property (nonatomic, strong) MVPSUserInfo * userInfo;

+ (CGFloat) getHeightForCellForUerInfo:(MVPSUserInfo *)userInfo;

@end
