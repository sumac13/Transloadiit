//
//  TLImageUpload.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLImageUpload.h"

@interface TLImageUpload ()

@property (nonatomic, strong) TLImageMetadata *metadata;

@end


@implementation TLImageUpload

#pragma mark - Getters

- (TLImageMetadata*)metadata
{
    if (!_metadata) {
        _metadata = [[TLImageMetadata alloc] initWithDictionary:self.uploadDict[@"meta"]];
    }
    return _metadata;
}

@end
