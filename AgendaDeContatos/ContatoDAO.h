//
//  ContatoDAO.h
//  AgendaDeContatos
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;

- (void)adicionaContato:(Contato *)contato;
- (NSInteger)total;
- (Contato *)contatoDoIndice:(NSInteger)indice;
- (void)removeContato:(Contato *)contato;
- (NSInteger)indiceDoContato:(Contato *)contato;

+ (ContatoDAO *)contatoDAOInstance;

@end

NS_ASSUME_NONNULL_END
