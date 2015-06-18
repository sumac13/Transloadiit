//
//  TLTemplate.h
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>

@interface TLTemplate : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *name;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end