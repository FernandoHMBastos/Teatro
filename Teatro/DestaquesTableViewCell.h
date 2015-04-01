//
//  DestaquesTableViewCell.h
//  Teatro
//
//  Created by Gabarron on 31/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestaquesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UILabel *local;
@property (weak, nonatomic) IBOutlet UIImageView *classificacaoIndicativa;
@property (weak, nonatomic) IBOutlet UILabel *preco;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *horario;

@end
