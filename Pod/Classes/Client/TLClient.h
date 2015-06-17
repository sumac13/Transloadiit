//
//  TLClient.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import "TLResponse.h"

@interface TLClient : NSObject

// Constructors
- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret;
- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret useSignature:(BOOL)useSignature;


@end
