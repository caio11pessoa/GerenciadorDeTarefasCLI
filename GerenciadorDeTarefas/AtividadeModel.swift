//
//  AtividadeModel.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

struct Atividade: Codable, Equatable {
    var numero: Int
    var nome: String
    var descricao: String
    var feito: Bool

  static func == (dentro: Atividade, fora: Atividade) -> Bool {
        return dentro.nome == fora.nome && dentro.descricao == fora.descricao && dentro.feito == fora.feito
  }
}

struct ListaAtividades: Codable {
    var tarefas: [Atividade]
}
