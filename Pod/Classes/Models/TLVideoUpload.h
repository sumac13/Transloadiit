//
//  TLVideoUpload.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import "TLUpload.h"
#import "TLVideoMetadata.h"

@interface TLVideoUpload : TLUpload

@property (nonatomic, readonly) TLVideoMetadata *metadata;

@end
