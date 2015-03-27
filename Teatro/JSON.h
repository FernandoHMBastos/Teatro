//
//  JSON.h
//  Teatro
//
//  Created by Vítor Machado Rocha on 27/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSON : NSObject

-(void) json;

@property(nonatomic, strong) NSMutableArray *listaPecas;
@property(nonatomic, strong) NSMutableArray *sortedArray;


@end
