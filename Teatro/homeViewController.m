//
//  HomeViewController.m
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "HomeViewController.h"
#import "BackgroundLayer.h"

@interface HomeViewController ()



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAGradientLayer *bgLayer = [BackgroundLayer yellowGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
