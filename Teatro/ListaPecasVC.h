//
//  ListaPecasVC.h
//  Teatro
//
//  Created by Vítor Machado Rocha on 31/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaPecasVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pickerHeightEnabled;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pickerHeight;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISwitch *buscaData;
@property (weak, nonatomic) IBOutlet UISwitch *Gratuito;

@end
