//
//  TLAudioUpload.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLAudioUpload.h"

@interface TLAudioUpload ()

@property (nonatomic, strong) TLAudioMetadata *metadata;

@end

@implementation TLAudioUpload

#pragma mark - Getters

- (TLAudioMetadata*)metadata
{
    if (!_metadata) {
        _metadata = [[TLAudioMetadata alloc] initWithDictionary:self.uploadDict[@"meta"]];
    }
    return _metadata;
}

@end
