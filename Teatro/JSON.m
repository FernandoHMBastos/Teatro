//
//  JSON.m
//  Teatro
//
//  Created by Vítor Machado Rocha on 27/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "JSON.h"
#import "Peca.h"

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
        
        if (error) {
            
            NSLog(@"Error reading file2: %@", error.localizedDescription);
            
            
        }else{
            //aqui vc manipula seu array
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            self.listaPecas = [[NSMutableArray alloc] init];
            
            for (NSDictionary* dic in array) {
                
                Peca* p = [[Peca alloc] init];
                
                [p setTituloString:[dic objectForKey:@ "Titulo"] ];
                [[p ficha] setGrupoString:[dic objectForKey:@ "Grupo"] ];
                [[p ficha ]setDirecaoString:[dic objectForKey:@ "Direcao"] ];
                [p setHorarioString:[dic objectForKey:@ "Horario"] ];
                [[p ficha]setDuracaoString:[dic objectForKey:@ "Duracao"] ];
                [p setFaixaEtariaString:[dic objectForKey:@ "Faixa Etaria"] ];
                [p setPrecoString:[dic objectForKey:@ "Preco"] ];
                [[p ficha]setSinopseString:[dic objectForKey:@ "Sinopse"] ];
                [[p ficha]setElencoString:[dic objectForKey:@ "Elenco"] ];
                [p setLocalString:[dic objectForKey:@ "Local"] ];
                [[p ficha]setContatoString:[dic objectForKey:@ "Contato"] ];
                [p setEnderecoString:[dic objectForKey:@ "Endereco"] ];
                [p setGeneroString:[dic objectForKey:@ "Genero"] ];
                
                [self.listaPecas addObject:p];
                
            }
            
           //organiza o array em ordem de acordo com uma chave
            
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"TituloString" ascending:YES selector:@selector(caseInsensitiveCompare:)];
            
            NSArray *sortedArray = [self.listaPecas sortedArrayUsingDescriptors:@[sort]];
            
            self.mutableSortedArray = [sortedArray copy];

            
            self.listaPecas = self.mutableSortedArray;

            
        }
    }
}



@end
