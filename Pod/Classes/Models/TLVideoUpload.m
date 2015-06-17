//
//  TLVideoUpload.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLVideoUpload.h"

@interface TLVideoUpload ()

@property (nonatomic, strong) TLVideoMetadata *metadata;

@end


@implementation TLVideoUpload


#pragma mark - Getters

- (TLVideoMetadata*)metadata
{
    if (!_metadata) {
        _metadata = [[TLVideoMetadata alloc] initWithDictionary:self.uploadDict[@"meta"]];
    }
    return _metadata;
}

@end
