//
//  MVPSUserInfoViewModel.h
//  MVPSampleApp
//
//  Created by webonise on 27/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVPSUserInfoViewModel : NSObject

/*!
 * Loads user info list from local json & returns
 */
- (NSArray *) loadUserInfoFromRespnose:(NSArray *) allUserInfoList;

@end
