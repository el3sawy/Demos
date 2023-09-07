//
//  NetworkPotocol.h
//  PlayWithObjectiveC
//
//  Created by Ahmed Elesawy on 01/12/2022.
//

#ifndef NetworkPotocol_h
#define NetworkPotocol_h

@protocol NetworkProtocol

@required
-(void) request;

@optional
-(void) download;

@end



#endif /* NetworkPotocol_h */
