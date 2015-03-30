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

//Inicializa com o numero de seções da table view valendo 1(Não é necessário mais, pois a propria tableview replica o number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


//Método que indica quantos objetos(Peças) possui o dictionary retirado do JSON
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[self lista] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Identifica a tableview com o nome cell
    static NSString *CellIdentifier = @"cell";
    listaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Troca a Label titulo pelo nome do titulo da peça para ser mostrado na lista do tableview
    Peca *peca = self.lista[indexPath.row];
    cell.titulo.text = peca.TituloString;
    
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
 
    //Indentifica o Segue, ou seja, mostra o que deve ser feito quanto o usuário clicar em algum item da lista da tableview
    if ([segue.identifier isEqualToString:@"Detail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Peca *peca = self.lista[indexPath.row];
        
    //Cria um objeto da Peca view controller para manipular as variaveis neles contidos e mostrar a label da pagina de descrição da peça(Tela em azul e amarelo que contem as informações da Peça) que está ligada a PecaViewController.
        PecaViewController *pecaViewController = [segue destinationViewController];
        pecaViewController.peca = peca;
        
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
