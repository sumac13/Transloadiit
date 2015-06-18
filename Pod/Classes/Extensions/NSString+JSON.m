//
//  NSString+JSON.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

+ (NSString*)jsonStringFromDictionary:(NSDictionary*)dictionary
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
