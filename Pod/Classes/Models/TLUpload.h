//
//  TLUpload.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

@interface TLUpload : NSObject

@property (nonatomic, strong) NSDictionary *uploadDict;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *baseName;
@property (nonatomic, strong) NSString *extension;
@property (nonatomic, assign) double size;
@property (nonatomic, strong) NSString *mime;
@property (nonatomic, strong) NSString *field;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *originalIdentifier;

- (id)initWithDictionary:(NSDictionary*)dictionary;
+ (TLUpload*)uploadFromDictionary:(NSDictionary*)dictionary;

@end
