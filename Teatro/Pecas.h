//
//  PecasClasse.h
//  Teatro
//
//  Created by Gabarron on 26/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FichaTecnica.h"

@interface Pecas : NSObject

///strings que a lista de peças precisa ter aceso
@property (nonatomic, strong) NSString* tituloString;
@property (nonatomic, strong) NSString* precoString;
@property (nonatomic, strong) NSString* faixaEtariaString;
@property (nonatomic, strong) NSString* generoString;
@property (nonatomic, strong) NSString* localString;
@property (nonatomic, strong) NSString* enderecoString;
@property (nonatomic, strong) NSString* horarioString;
@property (nonatomic, strong) FichaTecninca* ficha;

@end


// Peca* p = [[Peca alloc] init]
// [[p ficha] setDirecaoString:@"Ramon"]