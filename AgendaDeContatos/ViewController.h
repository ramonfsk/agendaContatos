//
//  ViewController.h
//  AgendaDeContatos
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@protocol ViewControllerDelagate <NSObject>

- (void)contatoAdicionado:(Contato *)contato;
- (void)contatoAtualizado:(Contato *)contato;

@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *site;

@property ContatoDAO *dao;
@property Contato *contato;

@property id<ViewControllerDelagate> delegate;

@end

