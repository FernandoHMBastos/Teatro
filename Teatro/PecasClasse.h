//
//  PecasClasse.h
//  Teatro
//
//  Created by Gabarron on 26/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PecasClasse : NSObject

@property (nonatomic, strong) NSString* TituloString; 
@property (nonatomic, strong) NSString* PrecoString;
@property (nonatomic, strong) NSString* LocalString;
@property (nonatomic, strong) NSString* FaixaEtariaString;
@property (nonatomic, strong) NSString* GrupoString;
@property (nonatomic, strong) NSString* GeneroString;

-(void)chamarPeca;

@end
