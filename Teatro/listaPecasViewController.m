//
//  listaPecasViewController.m
//  Teatro
//
//  Created by Vítor Machado Rocha on 27/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "listaPecasViewController.h"
#import "listaTableViewCell.h"
#import "Peca.h"
#import "PecaViewController.h"
#import "BackgroundLayer.h"

@interface listaPecasViewController ()

///Recebe a lista
@property(nonatomic, strong) NSMutableArray *lista;

@end

@implementation listaPecasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///Chama a mutable array do json e passa os dados para a lista daqui
     JSON *lista = [[JSON alloc] init];
    [lista json];
    self.lista = lista.listaPecas;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[self lista] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    
    //Cria uma cell com as características que a gente deu no listaTableViewCell com o Identifier que demos pra ela
    listaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Define o título, local, preço, imagem, classificação indicadiva, horário e data da peça de acordo com cada objeto da lista de peças
    Peca *peca = self.lista[indexPath.row];
    cell.titulo.text = peca.TituloString;
    cell.local.text = peca.LocalString;
    cell.preco.text = peca.PrecoString;
    cell.imagem.image = [UIImage imageNamed: peca.NomeImagem];
    cell.classificacaoIndicativa.image = [UIImage imageNamed: peca.FaixaEtariaString];
    cell.data.text = peca.DataString;
    cell.horario.text = peca.HorarioString;
    
    //Falta criar a váriavel que vai pegar o inteiro de indexPath
    /*if (indexPath%2 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:(20/255.0)  green:(80/255.0)  blue:(190/255.0)  alpha:1.0];
    }
    else {
        cell.backgroundColor = [UIColor colorWithRed:(60/255.0)  green:(100/255.0)  blue:(130/255.0)  alpha:1.0];
    }*/
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Pergunta se o segue chamado é o Detail (vai ser porque a gente falou pra ser no listaTableViewCell)
    if ([segue.identifier isEqualToString:@"Detail"]) {
        
        //Cria uma váriavel indexPath que pega qual linha foi clicada, identificando o objeto escolhido.
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //Cria a Peca peca e fala que o index dela vai ser o da linha clicada
        Peca *peca = self.lista[indexPath.row];

        //Contacta a PecaViewCOntroller de que a peca a ser mostrada no tela chamada pelo segue escolhido é a peca com o index da linha clicada
        PecaViewController *pecaViewController = [segue destinationViewController];
        pecaViewController.peca = peca;
    }
}

@end
