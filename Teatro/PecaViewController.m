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
#import "FichaTecnica.h"
#import "JSON.h"



@interface PecaViewController () <UITableViewDelegate, UITableViewDataSource>

///Labels da view de cada peça (as que tem "Peca"no nome são para não serem duplicadas, pois na view de lista de peças já existe o campo
@property (weak, nonatomic) IBOutlet UIImageView *imagemPeca;
@property (weak, nonatomic) IBOutlet UILabel *tituloPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *grupoLabel;
@property (weak, nonatomic) IBOutlet UILabel *direcaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *horarioPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *duracaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *faixaEtariaLabel;
@property (weak, nonatomic) IBOutlet UILabel *precoPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *sinopseLabel;
@property (weak, nonatomic) IBOutlet UILabel *elencoLabel;
@property (weak, nonatomic) IBOutlet UILabel *localPecaLabel;
@property (weak, nonatomic) IBOutlet UILabel *contatoLabel;
@property (weak, nonatomic) IBOutlet UILabel *enderecoLabel;
@property (weak, nonatomic) IBOutlet UILabel *generoPecaLabel;
@property (weak, nonatomic) IBOutlet UITableView *listaPecas;

///Labels da view de lista de peças
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;

@end


@implementation PecaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JSON *json = [[JSON alloc] init];
    [json json];

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
    
    [self chamarPeca];
    
}

-(void)chamarPeca:(PecasClasse*)peca{
    
    ///Aloca as duas classes para que seus valores sejam chamados e levados para as labels
    //PecasClasse *peca = [[PecasClasse alloc] init];
    FichaTecnica *ficha = [peca ficha];
    
    ///Passa os valores da classe PecasClasse para as labels
    self.tituloPecaLabel.text = peca.tituloString;
    self.horarioPecaLabel.text = peca.horarioString;
    self.faixaEtariaLabel.text = peca.faixaEtariaString;
    self.precoPecaLabel.text = peca.precoString;
    self.localPecaLabel.text = peca.localString;
    self.enderecoLabel.text = peca.enderecoString;
    self.generoPecaLabel.text = peca.generoString;
    
    ///Passa os valores da classe FichaTécnica para as labels
    self.grupoLabel.text = ficha.grupoString;
    self.direcaoLabel.text = ficha.direcaoString;
    self.duracaoLabel.text = ficha.duracaoString;
    self.sinopseLabel.text = ficha.sinopseString;
    self.elencoLabel.text = ficha.elencoString;
    self.contatoLabel.text = ficha.contatoString;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqual:@"ModeloPeca"]) {
        [[segue destinationViewController] chamarPeca:pecaEscolhida];
    }
}




@end
