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
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ssZZZZ"];
    return [formatter dateFromString:dateString];
}

@end
