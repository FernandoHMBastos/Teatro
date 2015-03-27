//
//  PecaViewController.h
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PecaViewController : UIViewController

/** Passa os dados da peça selecionada para os labels
 **/
-(void)chamarPeca;


@property (weak, nonatomic) IBOutlet UILabel *FichaTecnicaLabel;



@end
