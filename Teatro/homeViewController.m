//
//  HomeViewController.m
//  Teatro
//
//  Created by Gabarron on 25/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "HomeViewController.h"
#import "BackgroundLayer.h"
#import "listaTableViewCell.h"
#import "Peca.h"
#import "PecaViewController.h"
#import "BackgroundLayer.h"
#import "JSON.h"
#import "Destaques.h"
#import "MMParallaxCell.h"

@interface HomeViewController ()

@property(nonatomic, strong) NSMutableArray *lista;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Destaques *lista = [[Destaques alloc] init];
    [lista destaques];
    self.lista = lista.listaDestaques;
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
}


- (void)viewWillAppear:(BOOL)animated {
    //View para fazer algo quanto a "ABA" HELP aparecer.
    [super viewWillAppear:animated];
    
    //Cria a bglayer e chama a confirguração setada no BackgrundLayer.h
    CAGradientLayer *bgLayer = [BackgroundLayer greenGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return [[self lista] count];
    return [self.lista count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"CellIdentifier";
   
    MMParallaxCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[MMParallaxCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Peca *peca = [self.lista objectAtIndex:indexPath.row];
    
    cell.parallaxImage.image = [UIImage imageNamed:peca.NomeImagem];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DestaqueSegue" sender:nil];
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
    if ([segue.identifier isEqualToString:@"DestaqueSegue"]) {
        
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
