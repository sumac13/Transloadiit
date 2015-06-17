//
//  NSDate+Transloadit.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "NSDate+Transloadit.h"

@implementation NSDate (Transloadit)

+ (NSDate*)dateFromTransloaditString:(NSString*)dateString
{
    return [[self formatter] dateFromString:dateString];
}

+ (NSString*)transloaditDateStringFromDate:(NSDate*)date
{
    return [[self formatter] stringFromDate:date];
}


#pragma mark - Helper

+ (NSDateFormatter*)formatter
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ssZZZZ"];
    return formatter;
}

@end
