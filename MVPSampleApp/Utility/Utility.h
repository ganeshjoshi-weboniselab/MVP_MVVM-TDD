//
//  Utility.h
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

/*!
 * Get JSON from given string
 */
+ (NSDictionary *) getJsonFromString:(NSString *)jsonString;

/*!
 * Get JSON from file
 */
+ (NSArray *) getJsonFromFile:(NSString *)fileName;

/*!
 * Validate email id from given string
 */
+ (BOOL) isValidEmailID:(NSString *)emailID;

/*!
 * Return height for text for required width & font size 
 */
+ (CGFloat) getHeightForText:(NSString *)text forWidth:(CGFloat)width fontSize:(NSUInteger)fontSize;

/*!
 * Converts text in lowercase
 */
+ (NSString *) lowerCaseTextFromText:(NSString *)text;

/*!
 * Shorten text to words with given count & truncate if text have more words.
 */
+ (NSString *) shortenOrTruncateText:(NSString *)text toWordCount:(NSInteger)numberOfWords;

@end
