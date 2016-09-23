//
//  MVPSUserInfo+View.m
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfo+View.h"
#import "Utility.h"

#define KEY_POST_ID     @"postId"
#define KEY_ID          @"id"
#define KEY_NAME        @"name"
#define KEY_EMAIL_ID    @"email"
#define KEY_BODY        @"body"

#define MaxNumberOfWords 3

@implementation MVPSUserInfo (View)

- (void) loadUserInfo:(NSDictionary *) userInfo
{
    self.postID     = [userInfo objectForKey:KEY_POST_ID];
    self.userID     = [userInfo objectForKey:KEY_ID];
    self.name       = [userInfo objectForKey:KEY_NAME];
    self.emailID    = [userInfo objectForKey:KEY_EMAIL_ID];
    self.emailBody  = [userInfo objectForKey:KEY_BODY];
}

- (NSString *) nameWithThreeWords
{    
    return [Utility shortenOrTruncateText:self.name toWordCount:MaxNumberOfWords];
}

- (NSString *) emailInLowerCase
{
    return [Utility lowerCaseTextFromText:self.emailID];
}

@end
