//
//  Contato.h
//  AgendaDeContatos
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contato : NSObject

@property NSString *nome;
@property NSString *endereco;
@property NSString *email;
@property NSString *telefone;
@property NSString *site;

@end

NS_ASSUME_NONNULL_END
