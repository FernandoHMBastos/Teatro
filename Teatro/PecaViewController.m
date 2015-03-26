//
//  PecaViewController.m
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "PecaViewController.h"
#import "PecasClasse.h"
#import "BackgroundLayer.h"

@interface PecaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;

@end

@implementation PecaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    //View para fazer algo quanto a "ABA" HELP aparecer.
    [super viewWillAppear:animated];
    CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)VerPeca:(id)sender {
    
    
    
    PecasClasse *Peca = [[PecasClasse alloc] init];
    [Peca chamarPeca];
    
    //self.FichaTecnicaLabel.text = Peca.FichaTecnicaString;
    //self performSegueWithIdentifier:@"" sender:(ModeloPeca);
}




@end
