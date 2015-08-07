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

@property (weak, nonatomic) IBOutlet UIButton *mailButton;


@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self springButton];
    

}

- (void)viewWillAppear:(BOOL)animated {
    //View para fazer algo quanto a "ABA" HELP aparecer.
    [super viewWillAppear:animated];
    
    //Cria a bglayer e chama a confirguração setada no BackgrundLayer.h
   /* CAGradientLayer *bgLayer = [BackgroundLayer greenGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Botões
- (IBAction)mailMe:(id)sender {
    
    //Action para abrir o email do usuário com o destino do email como: email@email.com.
    NSURL *url = [NSURL URLWithString:@"mailto:email@email.com"];
    [[UIApplication sharedApplication] openURL:url];
}

-(void)springButton{

    self.mailButton.transform = CGAffineTransformMakeScale(1.0, 1.0);

    [UIView animateWithDuration:2 delay:0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.mailButton.transform = CGAffineTransformMakeScale(0.7, 0.7);
    } completion:^(BOOL finished){[self springButton];}];
      
}

-(void)loop{

   
    
}


@end
