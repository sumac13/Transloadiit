//
//  TLImageMetadata.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLImageMetadata.h"

@implementation TLImageMetadata


#pragma mark - Constructors

- (id)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        [self setAttributesWithDictionary:dict];
    }
    return self;
}


#pragma mark - Getters

- (void)setAttributesWithDictionary:(NSDictionary*)dict
{
    
}

@end
