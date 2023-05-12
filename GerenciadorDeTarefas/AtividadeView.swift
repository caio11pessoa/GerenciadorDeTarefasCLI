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
        print("\nVocê deseja selecionar alguma atividade?\nSe não, digite qualquer coisa para voltar ao menu principal")
        for i in 0..<quantidade {
            print("Atividade \(i + 1)")
        }
    }
    
    func delete() {
        print("""
            Você deseja deletar essa atividade?
            [s] -  Sim
            [n] -  Não raleu mofi
            """)
        
    }
    func printAtividade(atividades: [Atividade]){
        print("Atividades:")
        for atividade in atividades {
            print("""
                ----------------------------------------------
                Nome da atividade: \(atividade.nome)
                Descrição da atividade: \(atividade.descricao)
                Feita: \(atividade.feito)
                """)
        }
        print("----------------------------------------------")
    }
    func options() {
        print("""
                O que voce deseja fazer?
                [a] - Editar a tarefa
                [b] - Marcar como concluida
                [c] - Deletar tarefa
                
                [e] - Voltar para o menu
                """)
    }
    func editar(){
        print("""
              O que voce deseja editar?
              [a] - Nome
              [b] - Descricao
              
              [e] - Sair
              """)
    }
    func telaEdicao(atributo: String, atributoAntigo: String){
        print("""
            -\(atributo) anterior: \(atributoAntigo)
            - Digite o valor que deseja: 
            """)
    }
    
    func concluir(atividade nome: String){
        print("""
            Atividade \(nome) concluída!!!
            """)
    }
}
