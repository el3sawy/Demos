//
//  ViewController.m
//  PlayWithObjectiveC
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

#import "ViewController.h"
#import "Shape/Shape.h"
#import "Category/NSObject+Printable.h"
#import "Category/Network.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    Shape *shape1 = [[Shape alloc] init];
    Shape *shape2 = [Shape new];
    
    [shape1 firstFunc];
    [shape2 firstFunc:10];
    int result = [shape1 setWidth:10 andSetHeight:10];
    printf("%d \n", result);
    [Shape secondFunc];
    [shape1 setName:@"Ahmed"];
    shape1->width = 10;
    
    [shape2 release];
    // Properte
    [shape1 setPro1:19];
   
    
    printf(" the prod1  %d \n", shape1.pro1);
    printf(" the prod1  %d",  [shape1 pro1]);
    
    
    // ------- Category -----------
    
    NSObject *objec = [NSObject new];
    
    [objec printable];
    
    
    //=================
    Network *net = [Network new];
    [net request];
    

}


@end
