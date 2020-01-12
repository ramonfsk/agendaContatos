//
//  ListaContatosViewController.m
//  AgendaDeContatos
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "Contato.h"
#import "ContatoDAO.h"

@implementation ListaContatosViewController

//- (id) é igual a - (NSObject *)
- (id)init {
    self = [super init];
    
    UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    self.navigationItem.rightBarButtonItem = botaoForm;
    self.navigationItem.title = @"Contatos";
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.dao = [ContatoDAO contatoDAOInstance];
    self.linhaSelecionada = -1;
    
    return self;
}

- (void)exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    form.delegate = self;
    //Assim eu informo que os contatos da classe ViewController quais sao os contatos;
    //form.dao = self.dao;
    
    if(self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    
    [self.navigationController pushViewController:form animated:YES];
//    NSLog(@"Exibe formulario!");
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        Contato *contato = [self.dao contatoDoIndice:indexPath.row];
        //NSLog(@"Recuperou o contato: %@", contato.nome);
        [self.dao removeContato:contato];
        //NSLog(@"deletou o contato do DAO");
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.dao contatoDoIndice:indexPath.row];
    [self exibeFormulario];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dao.total;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identificador = @"Celula";
    
    UITableViewCell *celula = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if(!celula) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    
    Contato *contato = [self.dao contatoDoIndice:indexPath.row];
    celula.textLabel.text = contato.nome;
    
    return celula;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}


- (void)contatoAdicionado:(Contato *)contato {
    self.linhaSelecionada = [self.dao indiceDoContato:contato];
    NSLog(@"Adicionado: %@", contato.nome);
    
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Alerta" message:[NSString stringWithFormat:@"Contato %@ adicionado com sucesso!", contato.nome] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    
    [self presentViewController:alerta animated:YES completion:nil];
}

- (void)contatoAtualizado:(Contato *)contato {
    self.linhaSelecionada = [self.dao indiceDoContato:contato];
    NSLog(@"Atualizado: %@", contato.nome);
    
//    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Alerta" message:[NSString stringWithFormat:@"Contato %@ alterado com sucesso!", contato.nome] preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
//    [alerta addAction:ok];
    
//    [self presentViewController:alerta animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada = -1;
}
@end
