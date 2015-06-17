//
//  TLClient.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import "TLClient.h"
#import "AFNetworking.h"
#import "NSDate+Transloadit.h"

@interface TLClient ()
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) AFHTTPRequestOperationManager *client;
@property (nonatomic, assign) BOOL useSignature;
@end


@implementation TLClient


#pragma mark - Constructor

- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret
{
    return [self initWithAuthKey:key authSecret:secret useSignature:NO];
}

- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret useSignature:(BOOL)useSignature
{
    self = [super init];
    if (self) {
        if (!key) [NSException raise:@"missing-parameter" format:nil];
        if (!secret) [NSException raise:@"missing-parameter" format:nil];
        self.key = key;
        self.secret = secret;
        self.useSignature = useSignature;
    }
    return self;
}


#pragma mark - Helpers

- (NSDictionary*)requestParamsWithParams:(NSDictionary*)params
{
    NSMutableDictionary *requestParams = [NSMutableDictionary new];
    NSMutableDictionary *mutableParams = [params mutableCopy];
    if (self.useSignature) {
        NSDate *expiresDate = [NSDate dateWithTimeIntervalSinceNow:60];
        mutableParams[@"auth"] = @{ @"key": self.key, @"expires": [NSDate transloaditDateStringFromDate:expiresDate] };
    }
    else {
        mutableParams[@"auth"] = @{ @"key": self.key };
    }
    requestParams[@"params"] = @""; //TODO -  convert params into JSON
    
    if (self.useSignature) {
        NSString *signature = @""; //TODO - Calculate
        /*
         Stringify the above JavaScript object into a JSON string.
         Calculate an RFC 2104-compliant HMAC hex signature on the string, with your Auth Secret as the key, and SHA1 as the hash algorithm.
         Add a signature field to your post request (or as a hidden field in your form), with the signature created in step 2.
         
         */
        requestParams[@"signature"] = signature;
    }
    return requestParams;
}


#pragma mark - Templates

- (void)createTemplateWithName:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)updateTemplateWithId:(NSString*)identifier template:(NSDictionary*)temp completion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)getTemplateWithId:(NSString*)identifier completion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)deleteTemplateWithId:(NSString*)identifier completion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)getTemplatesWithCompletion:(void (^)(NSError *error, id responseObject))completion
{
    
}


#pragma mark - Assemblies

- (void)getAssembliesWithCompletion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)getAssemblyWithUrl:(NSString*)assemblyUrl completion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)createAssemblyWithData:(NSData*)data templateId:(NSString*)templateId progrress:(void (^)(CGFloat progress))progress completion:(void (^)(NSError *error, id responseObject))completion
{
    
}

- (void)createAssemblyWithData:(NSData*)data steps:(NSDictionary*)steps progrress:(void (^)(CGFloat progress))progress completion:(void (^)(NSError *error, id responseObject))completion
{
    
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
