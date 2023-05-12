//
//  ErrorHandler.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 11/05/23.
//

import Foundation

enum ErrorHandler: String {
    case opcaoNaoExiste = "Opção não existe"
    case nomeVazio = "Nome não pode ser vazio"
    case descricaoVazio = "Descricao não pode ser vazio"
    case indiceNaoExiste = "Índice não existe"
    case arquivoCorrompido = "Arquivo Corrompido, dados perdidos 😮‍💨"
}
