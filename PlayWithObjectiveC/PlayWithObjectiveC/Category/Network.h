//
//  ProtocolDemo.m
//  PlayWithObjectiveC
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

#import <Foundation/Foundation.h>
#import "NetworkPotocol.h"

// ===============


@interface Network : NSObject <NetworkProtocol>

@end


@implementation Network

- (void)request {
    printf("Request ");
}

@end
