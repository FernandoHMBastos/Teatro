//
//  ListaPecasVC.m
//  Teatro
//
//  Created by Vítor Machado Rocha on 31/03/15.
//  Copyright (c) 2015 Fernando H M Bastos. All rights reserved.
//

#import "ListaPecasVC.h"
#import "listaTableViewCell.h"
#import "Peca.h"
#import "PecaViewController.h"
#import "BackgroundLayer.h"
#import "JSON.h"

@interface ListaPecasVC()

@property(nonatomic, strong) NSMutableArray *lista;
@property(nonatomic, strong) NSString *strDate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) int a;

@end

@implementation ListaPecasVC

- (void)listaCompleta {
    ///Chama a mutable array do json e passa os dados para a lista daqui
    JSON *lista = [[JSON alloc] init];
    [lista json];
    self.lista = lista.listaPecas;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self listaCompleta];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    //self.tableView.backgroundView = nil;
    self.tableView.contentSize = CGSizeMake(self.tableView.frame.size.width, self.tableView.contentSize.height);

    // Do any additional setup after loading the view, typically from a nib.
    
    //self.tableView.backgroundColor = [UIColor blackColor];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /*
    CGRect newFrame = self.tableView.frame;
    newFrame.origin.y = self.tableView.frame.origin.y +80;
    [self.tableView setBounds: self.tableView.frame];
    [self.view setNeedsLayout];*/
    
    /*if (!self.buscaData.isOn)
    {        newFrame.origin.y = 0;
        NSLog(@"Pos %f", newFrame.origin.y);
        
        
    } else {
        newFrame.origin.y = self.datePicker.frame.origin.y + 80;
        NSLog(@"Pos %f", newFrame.origin.y);
    }
    
    [self.tableView setBounds:newFrame];
    
     NSLog(@"Pos %f,%f --> %f,%f", newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height);
    NSLog(@"Pos %f,%f --> %f,%f", self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height);
    [self.view setNeedsLayout];
        //newFrame.size.height += self.datePicker.frame.size.height;
    */
    
    /*if (self.buscaData.isOn) {
        self.pickerHeightEnabled.constant = 162;
    } else {
    self.pickerHeightEnabled.constant = 0;
    }*/
    
    //self.pickerHeightEnabled.constant = 0;
    //[self.view setNeedsLayout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

///Tira as linahs de divisão das células quando a tableview está vazia
-(UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

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
    
    if ([peca.ficha.PosicaoImagem isEqualToString:@"vertical"]) {
        cell.imagem.hidden = NO;
        cell.imagem2.hidden = YES;
        cell.imagem.image = [UIImage imageNamed: peca.NomeImagem];
    }
    else if ([peca.ficha.PosicaoImagem isEqualToString:@"horizontal"]) {
        cell.imagem.hidden = YES;
        cell.imagem2.hidden = NO;
        cell.imagem2.image = [UIImage imageNamed: peca.NomeImagem];
    }
    //cell.layer.borderWidth = 5.0f;
    //cell.layer.borderColor = [UIColor colorWithRed:(20/255.0)  green:(115/255.0)  blue:(215/255.0)  alpha:1.0].CGColor;
    
    //Falta criar a váriavel que vai pegar o inteiro de indexPath
    /*if (indexPath.row%2 == 0) {
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


- (IBAction)Gratuito:(UISwitch *)sender {
    
    if ([sender isOn]) {
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.PrecoString == %@", @"Gratuito"];
            [self listaCompleta];
            self.lista = [[NSMutableArray alloc] initWithArray:[self.lista filteredArrayUsingPredicate:predicate]];
        }
    else {
        
            [self listaCompleta];
        }
    
    
    [self.tableView reloadData];
    
}

/*
- (IBAction)datePicker:(id)sender {
    
    UIDatePicker* datePicker = (UIDatePicker*)sender;
    NSDate *selectedDate = [datePicker date];
    
    
    [self filterByDate:selectedDate];
    
}

-(void)filterByDate:(NSDate*)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    self.strDate = [dateFormat stringFromDate:date];
    
    
    if([self.Gratuito isOn]){
        
        [self listaCompleta];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.DataString == %@", self.strDate];
        self.lista = [[NSMutableArray alloc] initWithArray:[self.lista filteredArrayUsingPredicate:predicate]];
        predicate = [NSPredicate predicateWithFormat:@"SELF.PrecoString == %@", @"Gratuito"];
        self.lista = [[NSMutableArray alloc] initWithArray:[self.lista filteredArrayUsingPredicate:predicate]];
        
    }else{
        
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.DataString == %@", self.strDate];
        [self listaCompleta];
        self.lista = [[NSMutableArray alloc] initWithArray:[self.lista filteredArrayUsingPredicate:predicate]];
        
    }
    
    [self.tableView reloadData];
    
}*/





@end
