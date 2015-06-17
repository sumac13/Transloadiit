//
//  TLVideoMetadata.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TLVideoMetadata : NSObject

@property (nonatomic, assign) double width;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double frameRate;
@property (nonatomic, assign) double videoBitRate;
@property (nonatomic, strong) NSString *videoCodec;
@property (nonatomic, assign) double audioBitRate;
@property (nonatomic, assign) double audioSampleRate;
@property (nonatomic, assign) double audioChannels;
@property (nonatomic, strong) NSString *audioCodec;
@property (nonatomic, assign) BOOL seekable;
@property (nonatomic, strong) NSDate *dateRecorded;
@property (nonatomic, strong) NSDate *dateFileCreated;
@property (nonatomic, strong) NSDate *dateFileModified;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceVendor;
@property (nonatomic, strong) NSString *deviceSoftware;
@property (nonatomic, strong) CLLocation *coordinates;

- (id)initWithDictionary:(NSDictionary*)dict;

@end
