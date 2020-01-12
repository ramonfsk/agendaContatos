//
//  ViewController.m
//  AgendaDeContatos
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"
#import "ContatoDAO.h"

@implementation ViewController

//- (id) é igual a - (NSObject *)
- (id)initWithCoder:(NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.dao = [ContatoDAO contatoDAOInstance];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *botao = nil;
    if(self.contato){
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Altera" style:UIBarButtonItemStylePlain target:self action:@selector(altera)];
        self.navigationItem.title = @"Editar Contato";
    } else {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.title = @"Novo Contato";
    }
    
    self.navigationItem.rightBarButtonItem = botao;
    
    if(self.contato) {
        self.nome.text = self.contato.nome;
        self.endereco.text = self.contato.endereco;
        self.email.text = self.contato.email;
        self.telefone.text = self.contato.telefone;
        self.site.text = self.contato.site;
    }
}

- (void)adiciona {
    self.contato = [Contato new];
    [self pegaDadosDoFormulario];
    
    [self.dao adicionaContato:self.contato];
    
//    [self.delegate contatoAdicionado:self.contato];
    
//    NSLog(@"Nome: %@\nEndereco: %@\nE-mail: %@\nTelefone: %@\nSite: %@",
//          contato.nome, contato.endereco, contato.email, contato.telefone, contato.site);
    NSLog(@"%@", self.dao.contatos.description);
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAdicionado:self.contato];
}

- (void)altera {
    [self pegaDadosDoFormulario];
    
//    [self.delegate contatoAtualizado:self.contato];
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAtualizado:self.contato];
}

- (void)pegaDadosDoFormulario {
    self.contato.nome = self.nome.text;
    self.contato.endereco = self.endereco.text;
    self.contato.email = self.email.text;
    self.contato.telefone = self.telefone.text;
    self.contato.site = self.site.text;
}

@end
