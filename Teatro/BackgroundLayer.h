//
//  BackgroundLayer.h
//  Teatro
//
//  Created by Vítor Machado Rocha on 26/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BackgroundLayer : NSObject

///Blue gradient background
+(CAGradientLayer*) blueGradient;
+(CAGradientLayer*) yellowGradient;
//+(CAGradientLayer*) redGradient;

@end
