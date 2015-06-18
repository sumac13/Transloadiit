//
//  NSString+JSON.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

+ (NSString*)jsonStringFromDictionary:(NSDictionary*)dictionary;

@end
