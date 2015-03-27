//
//  FichaTecnica.h
//  Teatro
//
//  Created by Vítor Machado Rocha on 26/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PecasClasse.h"

@interface FichaTecnica : PecasClasse

///Strings que cada peça precisa ter acesso, referentes à ficha técnica
@property (nonatomic, strong) NSString* sinopseString;
@property (nonatomic, strong) NSString* grupoString;
@property (nonatomic, strong) NSString* direcaoString;
@property (nonatomic, strong) NSString* elencoString;
@property (nonatomic, strong) NSString* horarioString;
@property (nonatomic, strong) NSString* duracaoString;
@property (nonatomic, strong) NSString* contatoString;

@end
