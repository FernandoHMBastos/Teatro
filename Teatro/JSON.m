//
//  JSON.m
//  Teatro
//
//  Created by Vítor Machado Rocha on 27/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "JSON.h"

@interface JSON ()

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end


@implementation JSON

-(void) json
{

NSString *filepath = [[NSBundle mainBundle] pathForResource:@"TesteTeatro" ofType:@"txt"];

NSError *error;

NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];

NSData* data = [fileContents dataUsingEncoding:NSUTF8StringEncoding];

if (error)

NSLog(@"Error reading file1: %@", error.localizedDescription);

if (data) {
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    
    NSMutableArray * listaPecas = [[NSMutableArray alloc] init];
    for (NSDictionary* dic in array) {
        Peca* p = [[Peca alloc] init];
        [p setTituloString:[dic objectForKey:@ "Titulo"] ];
        [p setTituloString:[dic objectForKey:@ "Titulo"] ];
        [p setTituloString:[dic objectForKey:@ "Titulo"] ];
        [p setTituloString:[dic objectForKey:@ "Titulo"] ];
        [p setTituloString:[dic objectForKey:@ "Titulo"] ];
        [p setTituloString:[dic objectForKey:@ "Titulo"] ];

        [listaPecas addObject:p];
    }
    
    if (error) {
        
        NSLog(@"Error reading file2: %@", error.localizedDescription);
        
        
    }else{
        //aqui vc manipula seu array
        //for (NSArray *titulo in array) {
            
        //}
        
        for (NSArray *teste in array) {
            teste = [array objectAtIndex: array];
            NSLog(@"name=%@",[arrayResult objectForKey:@"Grupo"]);
            
        }
        
        
        }
    }
}

@end
