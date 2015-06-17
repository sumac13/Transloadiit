//
//  NSDate+Transloadit.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Transloadit)

+ (NSDate*)dateFromTransloaditString:(NSString*)dateString;
+ (NSString*)transloaditDateStringFromDate:(NSDate*)date;

@end
