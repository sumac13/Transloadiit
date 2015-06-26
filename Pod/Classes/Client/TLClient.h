//
//  TLClient.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import "TLResponse.h"
#import "TLTemplate.h"
#import "ReactiveCocoa.h"

typedef NS_ENUM(NSUInteger, TLOrder) {
    TLOrderAscendent,
    TLOrderDescendent
};

#define defend(b) b = (id)b ?: (id)^{}

@interface TLClient : NSObject

// Constructors

- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret;
- (id)initWithAuthKey:(NSString*)key authSecret:(NSString*)secret useSignature:(BOOL)useSignature;

// Reactive

- (RACSignal*)rac_createTemplateWithName:(NSString*)name template:(NSDictionary*)temp; // TLTemplate / Errror
- (RACSignal*)rac_updateTemplateWithId:(NSString*)identifier name:(NSString*)name template:(NSDictionary*)temp; // TLTemplate / Error
- (RACSignal*)deleteTemplateWithId:(NSString*)identifier; // Error / Completion
- (RACSignal*)rac_getTemplateDetailWithId:(NSString*)identifier; // TLTemplate / Error
- (RACSignal*)rac_getTemplatesSortedBy:(NSString*)sorted order:(TLOrder)order page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to;
- (RACSignal*)rac_getAllTemplates;
- (RACSignal*)rac_getAllAssembliesWithType:(NSArray*)type keywords:(NSArray*)keywords;
- (RACSignal*)rac_getAllAssembliesWithType:(NSArray*)type keywords:(NSArray*)keywords fromPage:(int)page pageLimit:(int)pageLimit;
- (RACSignal*)rac_getAssembliesWithType:(NSArray*)type keywords:(NSArray*)keywords page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to;
- (RACSignal*)rac_createAssemblyWithData:(NSData*)data name:(NSString*)name steps:(NSDictionary*)steps notifyUrl:(NSString*)notifyUrl;
- (RACSignal*)rac_createAssemblyWithData:(NSData*)data name:(NSString*)name templateId:(NSString*)templateId;
- (RACSignal*)rac_getAssemblyWithId:(NSString*)identifier;
- (RACSignal*)rac_cancelAssemblyWithId:(NSString*)identifier;
- (RACSignal*)rac_getAllNotificationsOfType:(NSString*)type;
- (RACSignal*)rac_getAllNotificationsOfType:(NSString*)type assemblyId:(NSString*)assemblyId;
- (RACSignal*)rac_getNotificationsOfType:(NSString*)type assemblyId:(NSString*)assemblyId page:(int)page pageSize:(int)pageSize;

// Blocks version

- (void)createTemplateWithName:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, TLTemplate* template))completion;
- (void)updateTemplateWithId:(NSString*)identifier name:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, TLTemplate* template))completion;
- (void)deleteTemplateWithId:(NSString*)identifier completion:(void (^)(NSError *error))completion;
- (void)getTemplateDetailWithId:(NSString*)identifier completion:(void (^)(NSError *error, TLTemplate * template))completion;
- (void)getAllTemplatesWithCompletion:(void (^)(NSError *error, NSArray * templates))completion;
- (void)getTemplatesSortedBy:(NSString*)sorted order:(TLOrder)order page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to completion:(void (^)(NSError *error, NSArray * templates))completion;
- (void)getAllAssembliesWithType:(NSArray*)type keywords:(NSArray*)keywords completion:(void (^)(NSError *error, NSArray * assemblies))completion;
- (void)getAllAssembliesWithType:(NSArray*)type keyword:(NSArray*)keywords fromPage:(int)page pageLimit:(int)pageLimit completion:(void (^)(NSError *error, NSArray * assemblies))completion;
- (void)getAssembliesWithType:(NSArray*)type keywords:(NSArray*)keywords page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to completion:(void (^)(NSError *error, NSArray * assemblies))completion;
- (void)createAssemblyWithData:(NSData*)data name:(NSString*)name steps:(NSDictionary*)steps notifyUrl:(NSString*)notifyUrl completion:(void (^)(NSError *error, TLResponse * response))completion;
- (void)createAssemblyWithData:(NSData*)data name:(NSString*)name templateId:(NSString*)templateId completion:(void (^)(NSError *error, TLResponse * response))completion;
- (void)createAssemblyWithData:(NSData*)data name:(NSString*)name params:(NSDictionary*)params completion:(void (^)(NSError *error, TLResponse * response))completion;
- (void)getAssemblyWithId:(NSString*)identifier completion:(void (^)(NSError *error, TLResponse * response))completion;
- (void)cancelAssemblyWithId:(NSString*)identifier completion:(void (^)(NSError *error, TLResponse *response))completion;

@end
