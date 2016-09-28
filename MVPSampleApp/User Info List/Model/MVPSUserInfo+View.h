//
//  MVPSUserInfo+View.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfo.h"

@interface MVPSUserInfo (View)

/*!
 * Load user info in model
 */
- (void) loadUserInfo:(NSDictionary *) userInfo;

/*!
 * Returns user name with only three words or truncated
 */
- (NSString *) nameWithThreeWords;

/*!S
 * Returns user email in lowercase 
 */
- (NSString *) emailInLowerCase;

@end
