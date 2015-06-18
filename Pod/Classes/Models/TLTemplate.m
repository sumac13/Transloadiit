//
//  TLTemplate.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLTemplate.h"

@implementation TLTemplate


#pragma mark - Constructors

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        [self setAttributesWithDictionary:dictionary];
    }
    return self;
}


#pragma mark - Setters

- (void)setAttributesWithDictionary:(NSDictionary*)dictionary
{
    if (dictionary[@"template_id"]) self.identifier = dictionary[@"template_id"];
    if (dictionary[@"template_content"]) self.content = dictionary[@"template_content"];
    if (dictionary[@"template_name"]) self.name = dictionary[@"template_name"];
}

@end
