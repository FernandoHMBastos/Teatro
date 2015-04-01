//
//  Destaques.m
//  Teatro
//
//  Created by Gabarron on 31/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "Destaques.h"
#import "Peca.h"

@implementation Destaques

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.listaDestaques = [[NSMutableArray alloc] init];
        self.mutableSortedArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

#pragma mark - Métodos

-(void) destaques
{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Destaques" ofType:@"txt"];
    
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
            self.listaDestaques = [[NSMutableArray alloc] init];
            
            for (NSDictionary *pecaDict in dict[@"Destaques"]) {
                
                Peca* p = [[Peca alloc] init];
                
                [p setTituloString:[pecaDict objectForKey:@ "Titulo"] ];
                [[p ficha] setGrupoString:[pecaDict objectForKey:@ "Grupo"] ];
                [[p ficha ]setDirecaoString:[pecaDict objectForKey:@ "Direcao"] ];
                [p setDataString:[pecaDict objectForKey:@ "Data"] ];
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
                [p setNomeImagem: [pecaDict objectForKey: @ "Imagem" ]];
                
                [self.listaDestaques addObject:p];
                
            }
            
            //organiza o array em ordem de acordo com uma chave
            
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"TituloString" ascending:YES selector:@selector(caseInsensitiveCompare:)];
            
            NSArray *sortedArray = [self.listaDestaques sortedArrayUsingDescriptors:@[sort]];
            
            self.mutableSortedArray = [sortedArray copy];
            
            self.listaDestaques = self.mutableSortedArray;
            
        }
    }
}


@end
