//
//  Shape.m
//  PlayWithObjectiveC
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

#import "Shape.h"


@implementation Shape

- (void)firstFunc {
    printf("firstFunc \n");
}

- (void)firstFunc:(int)x {
    printf("firstFunc %d \n", x);
}


- (int)setWidth:(int)x andSetHeight:(int)y {
    return x * y;
}

+ (void)secondFunc {
    printf("secondFunc");
  
}

- (void)setName:(NSString *)name {
    printf("NSString: %s\n", [name UTF8String]);
}
@end
