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

// Blocks version
- (void)createTemplateWithName:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, TLTemplate* template))completion;
- (void)updateTemplateWithId:(NSString*)identifier name:(NSString*)name template:(NSDictionary*)temp completion:(void (^)(NSError *error, TLTemplate* template))completion;
- (void)deleteTemplateWithId:(NSString*)identifier completion:(void (^)(NSError *error))completion;
- (void)getTemplateDetailWithId:(NSString*)identifier completion:(void (^)(NSError *error, TLTemplate * template))completion;
- (void)getTemplatesWithCompletion:(void (^)(NSError *error, NSArray * templates))completion;
- (void)getTemplatesSortedBy:(NSString*)sorted order:(TLOrder)order page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)from toDate:(NSDate*)to completion:(void (^)(NSError *error, NSArray * templates))completion;

// page
// pagesize
// sort
// order
// fromdate
// todate




// TODO - Notifications
// TODO - Assemblies

@end
