//
//  HelpViewController.m
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "HelpViewController.h"
#import "BackgroundLayer.h"
#import "JSON.h"

@interface HelpViewController ()



@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //achar maneira de imprimir a lista de peças pra ver se está certa
    // Do any additional setup after loading the view, typically from a nib.
    //JSON *j = [[JSON alloc] init];
    // j = [JSON sortedArray];
    
    // NSLog(@"%@",j.listaPecas);
}



- (void)viewWillAppear:(BOOL)animated {
    //View para fazer algo quanto a "ABA" HELP aparecer.
    [super viewWillAppear:animated];
    CAGradientLayer *bgLayer = [BackgroundLayer greenGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)mailMe:(id)sender {
    
    //Action para abrir o email do usuário com o destino do email como: email@email.com.
    NSURL *url = [NSURL URLWithString:@"mailto:email@email.com"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
