//
//  PecaViewController.m
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "PecaViewController.h"
#import "Peca.h"
#import "BackgroundLayer.h"
#import "FichaTecnica.h"
#import "JSON.h"



@interface PecaViewController () <UITableViewDelegate>

///Labels da view de cada peça (as que tem "Peca"no nome são para não serem duplicadas, pois na view de lista de peças já existe o campo
@property (weak, nonatomic) IBOutlet UIImageView *imagemPeca;
@property (weak, nonatomic) IBOutlet UIImageView *imagemPeca2;
@property (weak, nonatomic) IBOutlet UIImageView *classificacaoIndicativa;
@property (weak, nonatomic) IBOutlet UILabel *tituloPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *grupoLabel;
@property (weak, nonatomic) IBOutlet UILabel *direcaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *horarioPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *duracaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *precoPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *sinopseLabel;
@property (weak, nonatomic) IBOutlet UILabel *elencoLabel;
@property (weak, nonatomic) IBOutlet UILabel *localPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *contatoLabel;
@property (weak, nonatomic) IBOutlet UILabel *enderecoLabel;
@property (weak, nonatomic) IBOutlet UILabel *generoPecaLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;



@end


@implementation PecaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.backgroundImage.image = [UIImage imageNamed:@"background.jpg"];
    
    //Inicia a classe JSON e chama a função que carrega as peças do txt
    JSON *json = [[JSON alloc] init];
    [json json];
    
}

- (void)viewWillAppear:(BOOL)animated {
    //View para fazer algo quanto a "ABA" HELP aparecer.
    [super viewWillAppear:animated];
    
    //Cria a bglayer e chama a confirguração setada no BackgrundLayer.h
    CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
    //Chama o método que define as informações a serem mostradas, a partir do que o segue trouxe de informação da peça clicada
    [self chamarPeca:self.peca];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Métodos

-(void)chamarPeca:(Peca*)peca{
    
    ///Passa os valores da classe PecasClasse para as labels
    self.tituloPecaLabel.text = self.peca.TituloString;
    self.data.text = self.peca.DataString;
    self.horarioPecaLabel.text = self.peca.HorarioString;
    self.classificacaoIndicativa.image = [UIImage imageNamed: self.peca.FaixaEtariaString];
    self.precoPecaLabel.text = self.peca.PrecoString;
    self.localPecaLabel.text = self.peca.LocalString;
    self.enderecoLabel.text = self.peca.EnderecoString;
    self.generoPecaLabel.text = self.peca.GeneroString;
    
    if ([self.peca.ficha.PosicaoImagem isEqualToString:@"vertical"]) {
        self.imagemPeca.hidden = NO;
        self.imagemPeca2.hidden = YES;
        self.imagemPeca.image = [UIImage imageNamed: self.peca.NomeImagem];
    }
    else if ([self.peca.ficha.PosicaoImagem isEqualToString:@"horizontal"]) {
        self.imagemPeca.hidden = YES;
        self.imagemPeca2.hidden = NO;
        self.imagemPeca2.image = [UIImage imageNamed: self.peca.NomeImagem];
    }
    
    
    FichaTecnica *ficha = [self.peca ficha];
    
    ///Passa os valores da classe FichaTécnica para as labels
    self.grupoLabel.text = ficha.GrupoString;
    self.direcaoLabel.text = ficha.DirecaoString;
    self.duracaoLabel.text = ficha.DuracaoString;
    self.sinopseLabel.text = ficha.SinopseString;
    self.elencoLabel.text = ficha.ElencoString;
    self.contatoLabel.text = ficha.ContatoString;
}

@end
