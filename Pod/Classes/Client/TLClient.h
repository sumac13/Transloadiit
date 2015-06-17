//
//  TLClient.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

@interface TLClient : NSObject

- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret;

@end
