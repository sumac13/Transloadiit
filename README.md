# Transloadiit

![image](https://transloadit.com/img/robots/240x240/s3-store.jpg)

[![CI Status](http://img.shields.io/travis/Pedro/Transloadiit.svg?style=flat)](https://travis-ci.org/Pedro/Transloadiit)
[![Version](https://img.shields.io/cocoapods/v/Transloadiit.svg?style=flat)](http://cocoapods.org/pods/Transloadiit)
[![License](https://img.shields.io/cocoapods/l/Transloadiit.svg?style=flat)](http://cocoapods.org/pods/Transloadiit)
[![Platform](https://img.shields.io/cocoapods/p/Transloadiit.svg?style=flat)](http://cocoapods.org/pods/Transloadiit)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Transloadiit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Transloadiit", :git => "https://github.com/pepibumur/transloadiit"
```

## Features

- Reactive Interface
- Interface using blocks
- Input/Output defined models
- Actively maintained

## Technical details

### Models

```objc
@interface TLUpload : NSObject @end
@interface TLAudioUpload : NSObject @end
@interface TLAudioMetadata : NSObject @end
@interface TLImageUpload : NSObject @end
@interface TLImageMetadata : NSObject @end
@interface TLVideoUpload : NSObject @end
@interface TLVideoMetadata : NSObject @end
```

### Client interface

```objc
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
- (RACSignal*)rac_replayNotificationForAssemblyId:(NSString*)assemblyId;

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
- (void)getAllNotificationsOfType:(TLType)type completion:(void (^)(NSError *error, NSArray *notifications))completion;
- (void)getAllNotificationsOfType:(TLType)type assemblyId:(NSString*)assemblyId completion:(void (^)(NSError *error, NSArray *notifications))completion;
- (void)getNotificationsOfType:(TLType)type assemblyId:(NSString*)assemblyId page:(int)page pageSize:(int)pageSize completion:(void (^)(NSError *error, NSArray *notifications))completion;
- (void)replayNotificationForAssemblyId:(NSString*)assemblyId completion:(void (^)(NSError *error, NSDictionary *response))completion;
```

## Author

Pedro, pepibumur@gmail.com

## License

Transloadiit is available under the MIT license. See the LICENSE file for more info.
