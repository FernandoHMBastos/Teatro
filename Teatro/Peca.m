//
//  PecasClasse.m
//  Teatro
//
//  Created by Gabarron on 26/03/15.
//  Copyright (c) 2015 Bepid Campinas. All rights reserved.
//

#import "Peca.h"

@interface Peca ()


@end

@implementation Peca

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.ficha = [[FichaTecnica alloc] init];
        self.TituloString = @"Sem Título";
    }
    return self;
}
@end
