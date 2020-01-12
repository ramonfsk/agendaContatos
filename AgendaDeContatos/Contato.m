//
//  self.m
//  AgendaDeselfs
//
//  Created by Ramon Ferreira do Nascimento on 09/01/20.
//  Copyright © 2020 IBM. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@\nEndereco: %@\nE-mail: %@\nTelefone: %@\nSite: %@",
                       self.nome, self.endereco, self.email, self.telefone, self.site];
    
    return dados;
}

@end
