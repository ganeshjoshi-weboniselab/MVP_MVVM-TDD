//
//  Utility.m
//  MVPSampleApp
//
//  Created by webonise on 22/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSDictionary *) getJsonFromString:(NSString *)jsonString
{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *e;
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&e];
    
    return dict;
}

+ (NSArray *) getJsonFromFile:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];

    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(error)
        return nil;
    else
        return json;
}

+ (BOOL) isValidEmailID:(NSString *)emailID
{
    BOOL stricterFilter = NO;
    
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    
    NSPredicate *emailCheckPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    stricterFilter = [emailCheckPredicate evaluateWithObject:emailID];
    
    return stricterFilter;
}

+ (CGFloat) getHeightForText:(NSString *)text forWidth:(CGFloat)width fontSize:(NSUInteger)fontSize
{
    CGSize constraint = CGSizeMake(width, CGFLOAT_MAX);
    
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    
    CGSize boundingBox = [text boundingRectWithSize:constraint
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                            context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height;
}

+ (NSString *) lowerCaseTextFromText:(NSString *)text
{
    return [text lowercaseString];
}

+ (NSString *) shortenOrTruncateText:(NSString *)text toWordCount:(NSInteger)numberOfWords
{
    NSString * shortText;
    
    NSArray * nameComponents = [text componentsSeparatedByString: @" "];
    
    if([nameComponents count] <= numberOfWords)
        shortText = text;
    else
        shortText = [NSString stringWithFormat:@"%@ %@ %@...", [nameComponents objectAtIndex:0], [nameComponents objectAtIndex:1], [nameComponents objectAtIndex:2]];
    
    return shortText;
}

@end
