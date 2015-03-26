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

@property (nonatomic, strong) NSString* SinopseString;
@property (nonatomic, strong) NSString* GrupoString;
@property (nonatomic, strong) NSString* DirecaoString;
@property (nonatomic, strong) NSString* ElencoString;
@property (nonatomic, strong) NSString* HorarioString;
@property (nonatomic, strong) NSString* DuracaoString;
@property (nonatomic, strong) NSString* LocalString;

@end
