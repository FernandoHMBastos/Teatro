//
//  JSON.m
//  Teatro
//
//  Created by Vítor Machado Rocha on 27/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "JSON.h"


@implementation JSON

-(void) json
{

NSString *filepath = [[NSBundle mainBundle] pathForResource:@"TesteTeatro" ofType:@"rtf"];

NSError *error;

NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];

NSData* data = [fileContents dataUsingEncoding:NSUTF8StringEncoding];

if (error)

NSLog(@"Error reading file1: %@", error.localizedDescription);

if (data) {
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        
        NSLog(@"Error reading file2: %@", error.localizedDescription);
        
        
    }else{
        //aqui vc manipula seu array
        
        
        
        }
    }
}

@end
