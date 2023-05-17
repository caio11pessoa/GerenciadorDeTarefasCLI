//
//  AtividadeModel.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

struct Atividade: Codable {
    var numero: Int
    var nome: String
    var descricao: String
    var feito: Bool
}

struct ListaAtividades: Codable {
    var tarefas: [Atividade]
}
