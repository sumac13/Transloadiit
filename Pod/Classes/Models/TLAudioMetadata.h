//
//  TLAudioMetadata.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

@interface TLAudioMetadata : NSObject

@property (nonatomic, assign) double duration;
@property (nonatomic, assign) double bitRate;
@property (nonatomic, assign) double sampleRate;
@property (nonatomic, assign) double channels;
@property (nonatomic, strong) NSString *audioCodec;
@property (nonatomic, strong) NSString *artist;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
