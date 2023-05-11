//
//  AtividadeView.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeView {
    func display() {
        print("""
            O que voce deseja fazer??
            [a] - Ver minhas atividades
            [b] - Adicionar atividade
            [c] - Buscar atividade
            [e] - Exit
            """)
    }
    
    func createName() {
        print("""
            Escolha o nome para a sua atividade:
            """)
    }
    
    func createDescription() {
        print("""
            Escolha a descrição para a sua atividade:
            """)
    }

    func createData() {
        print("""
            Coloque a data, se quiser, se n quiser blz, só passa direto, blz?:
            """)
    }
    
    func busca() {
        print("""
            digite o nome da atividade:
            """)
    }
    
    func opcoesAtividades(quantidade: Int) {
        print("Você deseja selecionar alguma atividade?")
        for i in 0..<quantidade {
            print("Atividade \(i + 1)")
        }
    }
    
    func delete() {
        print("""
            Você deseja deletar essa atividade?
            [s]: Sim
            [n]: Não raleu mofi
            """)
        
    }
}
