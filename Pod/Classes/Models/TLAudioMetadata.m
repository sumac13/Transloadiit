//
//  TLAudioMetadata.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLAudioMetadata.h"

@implementation TLAudioMetadata

#pragma mark - Constructor

- (id)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        [self setAttributesWithDictionary:dict];
    }
    return self;
}


#pragma mark - Setters

- (void)setAttributesWithDictionary:(NSDictionary*)dict
{
    if (dict[@"duration"] && [dict[@"duration"] isKindOfClass:[NSNumber class]]) self.duration = [dict[@"duration"] doubleValue];
    if (dict[@"audio_bitrate"] && [dict[@"audio_bitrate"] isKindOfClass:[NSNumber class]]) self.bitRate = [dict[@"audio_bitrate"] doubleValue];
    if (dict[@"audio_samplerate"] && [dict[@"audio_samplerate"] isKindOfClass:[NSNumber class]]) self.sampleRate = [dict[@"audio_samplerate"] doubleValue];
    if (dict[@"audio_channels"] && [dict[@"audio_channels"] isKindOfClass:[NSNumber class]]) self.channels = [dict[@"audio_channels"] doubleValue];
    if (dict[@"audio_codec"]) self.audioCodec = dict[@"audio_codec"];
    if (dict[@"artist"]) self.artist = dict[@"artist"];
}

@end
