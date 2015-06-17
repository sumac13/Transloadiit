//
//  TLImageUpload.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import "TLUpload.h"
#import "TLImageMetadata.h"

@interface TLImageUpload : TLUpload

@property (nonatomic, readonly) TLImageMetadata *metadata;

@end
