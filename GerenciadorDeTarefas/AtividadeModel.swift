//
//  AtividadeModel.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

struct Atividade: Codable {
    var nome: String
    var descricao: String
    var feito: Bool
    var data: String?
}

struct ListaAtividades: Codable {
    var tarefas: [Atividade]
}

