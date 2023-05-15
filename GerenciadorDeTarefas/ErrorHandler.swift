//
//  ErrorHandler.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 11/05/23.
//

import Foundation

enum ErrorHandler: String {
    case opcaoNaoExiste = "\n! Opção não existe !"
    case nomeVazio = "\n! Nome não pode ser vazio !"
    case descricaoVazio = "\n! Descricao não pode ser vazio !"
    case numeroNaoExiste = "\n! Numero não existe !"
    case arquivoCorrompido = "Arquivo Corrompido, dados perdidos 😮‍💨"
}
