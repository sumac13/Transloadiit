//
//  TLClient.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLClient.h"
#import "AFNetworking.h"

@interface TLClient ()
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) AFHTTPRequestOperationManager *client;
@end


@implementation TLClient


#pragma mark - Constructor

- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret
{
    self = [super init];
    if (self) {
        if (!key) [NSException raise:@"missing-parameter" format:nil];
        if (!secret) [NSException raise:@"missing-parameter" format:nil];
        self.key = key;
        self.secret = secret;
    }
    return self;
}


#pragma mark - Lazy

- (AFHTTPRequestOperationManager*)client
{
    if (!_client) {
        _client = [[AFHTTPRequestOperationManager alloc] init];
    }
    return _client;
}



@end
