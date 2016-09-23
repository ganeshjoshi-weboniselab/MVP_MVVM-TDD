//
//  MVPSUserInfo+View.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "MVPSUserInfo.h"

@interface MVPSUserInfo (View)

- (void) loadUserInfo:(NSDictionary *) userInfo;

- (NSString *) nameWithThreeWords;

- (NSString *) emailInLowerCase;

@end
