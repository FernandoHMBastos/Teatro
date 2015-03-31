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

//+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end


@implementation JSON

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.listaPecas = [[NSMutableArray alloc] init];
        self.mutableSortedArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

#pragma mark - Métodos

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
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            self.listaPecas = [[NSMutableArray alloc] init];
            
            for (NSDictionary *pecaDict in dict[@"Peças"]) {
                
                Peca* p = [[Peca alloc] init];
                
                [p setTituloString:[pecaDict objectForKey:@ "Titulo"] ];
                [[p ficha] setGrupoString:[pecaDict objectForKey:@ "Grupo"] ];
                [[p ficha ]setDirecaoString:[pecaDict objectForKey:@ "Direcao"] ];
                [p setHorarioString:[pecaDict objectForKey:@ "Horario"] ];
                [[p ficha]setDuracaoString:[pecaDict objectForKey:@ "Duracao"] ];
                [p setFaixaEtariaString:[pecaDict objectForKey:@ "Faixa Etaria"] ];
                [p setPrecoString:[pecaDict objectForKey:@ "Preco"] ];
                [[p ficha]setSinopseString:[pecaDict objectForKey:@ "Sinopse"] ];
                [[p ficha]setElencoString:[pecaDict objectForKey:@ "Elenco"] ];
                [p setLocalString:[pecaDict objectForKey:@ "Local"] ];
                [[p ficha]setContatoString:[pecaDict objectForKey:@ "Contato"] ];
                [p setEnderecoString:[pecaDict objectForKey:@ "Endereco"] ];
                [p setGeneroString:[pecaDict objectForKey:@ "Genero"] ];
                
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
