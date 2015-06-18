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
#import <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
#import "NSString+JSON.h"

static NSString * const kTransloaditTemplatesPath = @"/templates";
static NSString * const kTransloaditTemplatesDetailPath = @"/templates/%@";

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
    requestParams[@"params"] =  [NSString jsonStringFromDictionary:params];
    if (self.useSignature) {
        NSString *signature = [self hashOfData:[NSString jsonStringFromDictionary:params] withKey:self.secret];
        requestParams[@"signature"] = signature;
    }
    return requestParams;
}


#pragma mark - Reactive

- (RACSignal*)rac_createTemplateWithName:(NSString*)name template:(NSDictionary*)temp
{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = [self requestParamsWithParams:@{ @"template": [NSString jsonStringFromDictionary:temp], @"name": name }];
        [self.client POST:kTransloaditTemplatesPath parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject[@"ok"] isEqualToString:@"TEMPLATE_CREATED"]) {
                [subscriber sendNext:[[TLTemplate alloc] initWithDictionary:responseObject]];
                [subscriber sendCompleted];
            }
            else {
                [subscriber sendError:[NSError errorWithDomain:@"transloadit.error" code:-1 userInfo:responseObject]];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal*)rac_updateTemplateWithId:(NSString*)identifier name:(NSString*)name template:(NSDictionary*)temp
{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = [self requestParamsWithParams:@{ @"template": [NSString jsonStringFromDictionary:temp], @"name": name }];
        [self.client PUT:[NSString stringWithFormat:kTransloaditTemplatesDetailPath, identifier] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject[@"ok"] isEqualToString:@"TEMPLATE_UPDATED"]) {
                [subscriber sendNext:[[TLTemplate alloc] initWithDictionary:responseObject]];
                [subscriber sendCompleted];
            }
            else {
                [subscriber sendError:[NSError errorWithDomain:@"transloadit.error" code:-1 userInfo:responseObject]];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal*)rac_deleteTemplateWithId:(NSString*)identifier
{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self.client DELETE:[NSString stringWithFormat:kTransloaditTemplatesDetailPath, identifier] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject[@"ok"] isEqualToString:@"TEMPLATE_DELETED"]) {
                [subscriber sendCompleted];
            }
            else {
                [subscriber sendError:[NSError errorWithDomain:@"transloadit.error" code:-1 userInfo:responseObject]];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal*)rac_getTemplateDetailWithId:(NSString*)identifier
{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self.client GET:[NSString stringWithFormat:kTransloaditTemplatesDetailPath, identifier] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject[@"ok"] isEqualToString:@"TEMPLATE_FOUND"]) {
                [subscriber sendNext:[[TLTemplate alloc] initWithDictionary:responseObject]];
                [subscriber sendCompleted];
            }
            else {
                [subscriber sendError:[NSError errorWithDomain:@"transloadit.error" code:-1 userInfo:responseObject]];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}

- (RACSignal*)rac_getTemplatesSortedBy:(NSString*)sorted order:(TLOrder)order page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to
{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSMutableDictionary *parameters = [NSMutableDictionary new];
        parameters[@"page"] = @(page);
        parameters[@"pagesize"] = @(pageSize);
        if (sorted) parameters[@"sorted"] = sorted;
        parameters[@"order"] = order == TLOrderAscendent ? @"asc" : @"desc";
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        if (from) parameters[@"fromdate"] = [formatter stringFromDate:from];
        if (to) parameters[@"todate"] = [formatter stringFromDate:to];
        [self.client GET:kTransloaditTemplatesPath parameters:[self requestParamsWithParams:parameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [subscriber sendNext:[[(NSArray*)responseObject rac_sequence] map:^TLTemplate*(NSDictionary* dict) {
                return [[TLTemplate alloc] initWithDictionary:dict];
            }]];
            [subscriber sendCompleted];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}


#pragma mark - Templates

- (void)createTemplateWithName:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, TLTemplate* template))completion
{
    [[self rac_createTemplateWithName:name template:temp] subscribeNext:^(TLTemplate *template) {
        completion(nil, template);
    } error:^(NSError *error) {
        completion(error, nil);
    }];
}

- (void)updateTemplateWithId:(NSString*)identifier name:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, TLTemplate* template))completion
{
    [[self rac_updateTemplateWithId:identifier name:name template:temp] subscribeNext:^(TLTemplate *template) {
        completion(nil, template);
    } error:^(NSError *error) {
        completion(error, nil);
    }];
}

- (void)deleteTemplateWithId:(NSString*)identifier completion:(void (^)(NSError *error))completion
{
    [[self rac_deleteTemplateWithId:identifier] subscribeError:^(NSError *error) {
        completion(error);
    } completed:^{
        completion(nil);
    }];
}

- (void)getTemplateDetailWithId:(NSString*)identifier completion:(void (^)(NSError *error, TLTemplate * template))completion
{
    [[self rac_getTemplateDetailWithId:identifier] subscribeNext:^(TLTemplate *template) {
        completion(nil, template);
    } error:^(NSError *error) {
        completion(error, nil);
    }];
}

- (void)getTemplatesWithCompletion:(void (^)(NSError *error, NSArray * templates))completion
{
    __block int pageLimit = 5000;
    __block int currentPage = 0;
    
    
}

- (void)getTemplatesSortedBy:(NSString*)sorted order:(TLOrder)order page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to completion:(void (^)(NSError *error, NSArray * templates))completion
{
    [[self rac_getTemplatesSortedBy:sorted order:order page:page pageSize:pageSize fromDate:from toDate:to] subscribeNext:^(NSArray *templates) {
        completion(nil, templates);
    } error:^(NSError *error) {
        completion(error, nil);
    }];
}


#pragma mark - Assemblies

- (void)getAssembliesWithCompletion:(void (^)(NSError *error, NSArray *assemblies))completion
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


#pragma mark - Helpers

- (NSString*)hashOfData:(NSString*)data withKey:(NSString*)key
{
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSString *hash;
    NSMutableString* output = [NSMutableString   stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    hash = output;
    return hash;
}


#pragma mark - Lazy

- (AFHTTPRequestOperationManager*)client
{
    if (!_client) {
        _client = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api2.transloadit.com"]];
    }
    return _client;
}



@end
