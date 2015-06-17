//
//  TLClientTests.m
//  
//
//  Created by Pedro Piñera Buendía on 17/06/15.
//
//

#import <Foundation/Foundation.h>
#import "TLClient.h"

SpecBegin(TLClientTests)

describe(@"initialization tests", ^{
    
    context(@"parameters", ^{
        it(@"should raise exception if there's no secret passed", ^{
            expect(^{ TLClient *client = [[TLClient alloc] initWithAuthKey:@"" authSecret:nil];}).to.raise(@"missing-parameter");
        });
        
        it(@"should raise exception if there's no key passed", ^{
            expect(^{ TLClient *client = [[TLClient alloc] initWithAuthKey:nil authSecret:@""];}).to.raise(@"missing-parameter");
        });
        it(@"should initialize if both parameters are passed", ^{
            expect(^{ TLClient *client = [[TLClient alloc] initWithAuthKey:@"" authSecret:@""];}).toNot.raise(@"missing-parameter");
        });
    });
    
});

SpecEnd