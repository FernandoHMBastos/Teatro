//
//  PecaViewController.m
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "PecaViewController.h"
#import "PecasClasse.h"

@interface PecaViewController ()

@end

@implementation PecaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)VerPeca:(id)sender {
    
    
    
    PecasClasse *Peca = [[PecasClasse alloc] init];
    [Peca chamarPeca];
    
    self.FichaTecnicaLabel.text = Peca.FichaTecnicaString;
    
}




@end
