//
//  TLImageMetadata.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TLImageMetadata : NSObject

@property (nonatomic, assign) double width;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double aspectRatio;
@property (nonatomic, strong) NSDate *dateRecorded;
@property (nonatomic, strong) NSDate *dateFileCreated;
@property (nonatomic, strong) NSDate *dateFileModified;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *keywords;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *creator;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *copyrightNotice;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, assign) double aperture;
@property (nonatomic, strong) NSString *exposureCompesation;
@property (nonatomic, strong) NSString *exposureMode;
@property (nonatomic, strong) NSString *exposureTime;
@property (nonatomic, strong) NSString *flash;
@property (nonatomic, strong) NSString *focalLength;
@property (nonatomic, assign) double fNumber;
@property (nonatomic, assign) double iso;
@property (nonatomic, assign) double lightValue;
@property (nonatomic, strong) NSString *meteringMode;
@property (nonatomic, strong) NSString *shutterSpeed;
@property (nonatomic, strong) NSString *whiteBalance;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceVendor;
@property (nonatomic, strong) NSString *deviceSoftware;
@property (nonatomic, strong) CLLocation *coordinates;
@property (nonatomic, assign) double thumbnailIndex;
@property (nonatomic, assign) double thumbnailOffset;
@property (nonatomic, assign) double frameCount;
@property (nonatomic, strong) NSString *colorSpace;
@property (nonatomic, assign) BOOL hasClippingPath;
@property (nonatomic, strong) NSString *averageColor;


- (id)initWithDictionary:(NSDictionary*)dict;

@end
