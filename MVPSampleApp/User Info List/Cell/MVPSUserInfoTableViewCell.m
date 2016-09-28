//
//  MVPSUserInfoTableViewCell.m
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfoTableViewCell.h"
#import "MVPSUserInfo.h"
#import "MVPSUserInfo+View.h"
#import "Utility.h"

#define LABEL_HEIGHT      21
#define LEFT_RIGHT_MARGIN 8
#define TOP_BOTTOM_MARGIN 8

#define NUMBER_OF_VERTICAL_MARGINS      4
#define NUMBER_OF_HORIZANTAL_MARGINS    2
#define NUMBER_OF_STATIC_LABELS         2

#define FONT_SIZE 16

@implementation MVPSUserInfoTableViewCell
{
    MVPSUserInfo *_userInfo;
}

@dynamic userInfo;

#pragma mark - Set User Info

- (void) setUserInfo:(MVPSUserInfo *)userInfo
{
    if(self->_userInfo != userInfo)
    {
        self->_userInfo = userInfo;
    }
    
    [self updateUI];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self updateUI];
}

#pragma mark End

- (void) updateUI
{
    self.lblName.text = [self->_userInfo nameWithThreeWords];
    self.lblEmailID.text = [self->_userInfo emailInLowerCase];
    self.lblBody.text = [self->_userInfo emailBody];
}

+ (CGFloat) getHeightForCellForUerInfo:(MVPSUserInfo *)userInfo
{
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    width = width - (NUMBER_OF_HORIZANTAL_MARGINS * LEFT_RIGHT_MARGIN);
    
    return [Utility getHeightForText:userInfo.emailBody forWidth:width fontSize:FONT_SIZE] + (NUMBER_OF_STATIC_LABELS * LABEL_HEIGHT) + (NUMBER_OF_VERTICAL_MARGINS * TOP_BOTTOM_MARGIN);
}

@end
