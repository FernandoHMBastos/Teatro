//
//  PecasClasse.h
//  Teatro
//
//  Created by Gabarron on 26/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FichaTecnica.h"

@interface Peca : NSObject

///strings que a lista de peças precisa ter acesso
@property (nonatomic, strong) NSString* TituloString;
@property (nonatomic, strong) NSString* PrecoString;
@property (nonatomic, strong) NSString* FaixaEtariaString;
@property (nonatomic, strong) NSString* GeneroString;
@property (nonatomic, strong) NSString* LocalString;
@property (nonatomic, strong) NSString* EnderecoString;
@property (nonatomic, strong) NSString* HorarioString;
@property (nonatomic, strong) FichaTecnica* ficha;

@end


// Peca* p = [[Peca alloc] init]
// [[p ficha] setDirecaoString:@"Ramon"]
