//
//  TLAudioUpload.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import "TLUpload.h"
#import "TLAudioMetadata.h"

@interface TLAudioUpload : TLUpload

@property (nonatomic, readonly) TLAudioMetadata *metadata;

@end
