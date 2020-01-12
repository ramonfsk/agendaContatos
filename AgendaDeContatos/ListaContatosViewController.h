//
//  ListaContatosViewController.h
//  AgendaDeContatos
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListaContatosViewController : UITableViewController<ViewControllerDelagate>

@property ContatoDAO *dao;
@property Contato *contatoSelecionado;

@property NSInteger linhaSelecionada;

@end

NS_ASSUME_NONNULL_END
