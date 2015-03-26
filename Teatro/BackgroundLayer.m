//
//  BackgroundLayer.m
//  Teatro
//
//  Created by Vítor Machado Rocha on 26/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "BackgroundLayer.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface BackgroundLayer ()


@end

@implementation BackgroundLayer

#pragma mark - Background

///Blue gradient background
+ (CAGradientLayer*) blueGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(60/255.0) green:(100/255.0) blue:(130/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(20/255.0)  green:(80/255.0)  blue:(190/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}

///Orange gradient background
+ (CAGradientLayer*) yellowGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(180/255.0) green:(80/255.0) blue:(95/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(240/255.0)  green:(135/255.0)  blue:(50/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}

///Green gradient background
+ (CAGradientLayer*) greenGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(95/255.0) green:(190/255.0) blue:(45/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(75/255.0)  green:(160/255.0)  blue:(135/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
}

@end
