//
//  Shape.h
//  PlayWithObjectiveC
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

#ifndef Shape_h
#define Shape_h
#import <Foundation/Foundation.h>

@interface Shape : NSObject {
    
    @public
    int width;
    int height;
}

@property int pro1, pro2; // mimic geter and setter 

-(void) firstFunc;
-(void) firstFunc: (int) x;
-(int) setWidth: (int) x andSetHeight: (int) y;
+(void) secondFunc;
-(void) setName: (NSString *) name;

@end

#endif /* Shape_h */
