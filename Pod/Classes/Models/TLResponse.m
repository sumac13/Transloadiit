//
//  TLResponse.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLResponse.h"
#import "TLUpload.h"
#import "NSDate+Transloadit.h"

@implementation TLResponse

#pragma mark - Constructor

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        [self setAttributesFromDictionary:dictionary];
    }
    return self;
}


#pragma mark - Setters

- (void)setAttributesFromDictionary:(NSDictionary*)dictionary
{
    if (dictionary[@"ok"]) [self setStatusFromString:dictionary[@"ok"]];
    if (dictionary[@"error"]) [self setErrorFromString:dictionary[@"error"]];
    if (dictionary[@"message"]) self.message = dictionary[@"message"];
    if (dictionary[@"assembly_id"]) self.assemblyId = dictionary[@"assembly_id"];
    if (dictionary[@"assembly_url"]) self.assemblyUrl = dictionary[@"assembly_url"];
    if (dictionary[@"assembly_ssl_url"]) self.assemblySslUrl = dictionary[@"assembly_ssl_url"];
    if (dictionary[@"bytes_received"] && [dictionary[@"bytes_received"] isKindOfClass:[NSNumber class]]) self.bytesReceived = [dictionary[@"bytes_received"] doubleValue];
    if (dictionary[@"bytes_expected"] && [dictionary[@"bytes_expected"] isKindOfClass:[NSNumber class]]) self.bytesExpected = [dictionary[@"bytes_expected"] doubleValue];
    if (dictionary[@"client_agent"]) self.clientAgent = dictionary[@"client_agent"];
    if (dictionary[@"client_ip"]) self.clientIp = dictionary[@"client_ip"];
    if (dictionary[@"client_referer"]) self.clientIp = dictionary[@"client_referer"];
    if (dictionary[@"start_date"]) self.startDate = [NSDate dateFromTransloaditString:dictionary[@"start_date"]];
    if (dictionary[@"upload_duration"] && [dictionary[@"upload_duration"] isKindOfClass:[NSNumber class]]) self.uploadDuration = [dictionary[@"upload_duration"] doubleValue];
    if (dictionary[@"execution_duration"] && [dictionary[@"execution_duration"] isKindOfClass:[NSNumber class]]) self.executionDuration = [dictionary[@"execution_duration"] doubleValue];
    if (dictionary[@"fields"]) self.fields = dictionary[@"fields"];
    NSMutableArray *uploads = [NSMutableArray new];
    if (dictionary[@"uploads"]) {
        for (NSDictionary *upload in dictionary[@"upload"]) {
            [uploads addObject:[TLUpload uploadFromDictionary:upload]];
        }
    }
    self.uploads = uploads;
}

- (void)setStatusFromString:(NSString*)statusString
{
    //TODO
}

- (void)setErrorFromString:(NSString*)errorString
{
    //TODO
}

@end
