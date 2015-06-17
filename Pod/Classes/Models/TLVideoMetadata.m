//
//  TLVideoMetadata.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLVideoMetadata.h"
#import "NSDate+Transloadit.h"

@implementation TLVideoMetadata

#pragma mark - Constructors

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
    if (dict[@"width"] && [dict[@"width"] isKindOfClass:[NSNumber class]]) self.width = [dict[@"width"] doubleValue];
    if (dict[@"height"] && [dict[@"height"] isKindOfClass:[NSNumber class]]) self.height = [dict[@"height"] doubleValue];
    if (dict[@"framerate"] && [dict[@"framerate"] isKindOfClass:[NSNumber class]]) self.frameRate = [dict[@"framerate"] doubleValue];
    if (dict[@"video_bitrate"] && [dict[@"video_bitrate"] isKindOfClass:[NSNumber class]]) self.videoBitRate = [dict[@"video_bitrate"] doubleValue];
    if (dict[@"video_codec"]) self.videoCodec = dict[@"video_codec"];
    if (dict[@"audio_bitrate"] && [dict[@"audio_bitrate"] isKindOfClass:[NSNumber class]]) self.audioBitRate = [dict[@"audio_bitrate"] doubleValue];
    if (dict[@"audio_samplerate"] && [dict[@"audio_samplerate"] isKindOfClass:[NSNumber class]]) self.audioSampleRate = [dict[@"audio_samplerate"] doubleValue];
    if (dict[@"audio_channels"] && [dict[@"audio_channels"] isKindOfClass:[NSNumber class]]) self.audioChannels = [dict[@"audio_channels"] doubleValue];
    if (dict[@"audio_codec"]) self.audioCodec = dict[@"audio_codec"];
    if (dict[@"seekable"] && [dict[@"seekable"] isKindOfClass:[NSNumber class]]) self.seekable = [dict[@"seekable"] boolValue];
    if (dict[@"date_recorded"]) self.dateRecorded = [NSDate dateFromTransloaditString:dict[@"date_recorded"]];
    if (dict[@"date_file_created"]) self.dateFileCreated = [NSDate dateFromTransloaditString:dict[@"date_file_created"]];
    if (dict[@"date_file_modified"]) self.dateFileModified = [NSDate dateFromTransloaditString:dict[@"date_file_modified"]];
    if (dict[@"device_name"]) self.deviceName = dict[@"device_name"];
    if (dict[@"device_vendor"]) self.deviceName = dict[@"device_vendor"];
    if (dict[@"device_software"]) self.deviceName = dict[@"device_software"];
    if ((dict[@"latitude"] && [dict[@"latitude"] isKindOfClass:[NSNumber class]]) &&
        (dict[@"longitude"] && [dict[@"longitude"] isKindOfClass:[NSNumber class]])) {
        double longitude = [dict[@"longitude"] doubleValue];
        double latitude = [dict[@"latitude"] doubleValue];
        self.coordinates = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    }
    
    
    
    
    if (dict[@"device_name"]) self.deviceName = dict[@"device_name"];



}

@end
