//
//  TLUpload.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLUpload.h"
#import "TLAudioUpload.h"
#import "TLImageUpload.h"
#import "TLVideoUpload.h"

@implementation TLUpload

#pragma mark - Constructor

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [[TLUpload uploadClassFromDictionary:dictionary] init];
    if (self) {
        
    }
    return self;
}

+ (TLUpload*)uploadFromDictionary:(NSDictionary*)dictionary
{
    return [[TLUpload alloc] initWithDictionary:dictionary];
}


#pragma mark - Setters

- (void)setupAttributesFromDictionary:(NSDictionary*)dict
{
    self.uploadDict = dict;
    if (dict[@"id"]) self.identifier = dict[@"id"];
    if (dict[@"name"]) self.name = dict[@"name"];
    if (dict[@"basename"]) self.baseName = dict[@"basename"];
    if (dict[@"ext"]) self.extension = dict[@"ext"];
    if (dict[@"size"] && [dict[@"size"] isKindOfClass:[NSNumber class]]) self.size = [dict[@"size"] doubleValue];
    if (dict[@"mime"]) self.mime = dict[@"mime"];
    if (dict[@"field"]) self.field = dict[@"field"];
    if (dict[@"url"]) self.url = dict[@"url"];
    if (dict[@"original_id"]) self.originalIdentifier = dict[@"original_id"];
}



#pragma mark - Helpers

+ (Class)uploadClassFromDictionary:(NSDictionary*)dictionary
{
    if (dictionary[@"type"] && [dictionary[@"type"] isEqualToString:@"video"]) {
        return [TLVideoUpload class];
    }
    else if (dictionary[@"type"] && [dictionary[@"type"] isEqualToString:@"image"]) {
        return [TLImageUpload class];
    }
    else {
        return [TLAudioUpload class];
    }
}

@end
