//
//  AtividadeController.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeController {
    let atividadeView: AtividadeView = AtividadeView()

    lazy var mockAtividades: ListaAtividades = jsonHandler.getJson()!
        
    let jsonHandler = JsonHandler()
    
    func didLoad() {
       
        atividadeView.display()
        guard let acao: String = readLine() else {
            return didLoad()
        }
        switch acao {
        case "a","A":
            //TODO:: Formatar bonitinho
            atividadeView.printAtividade(atividades: mockAtividades.tarefas)
            _ = readLine()
            print("\n\n\n")
            didLoad()
        case "b", "B":
            //TODO tirar o force
            print(atividadeCreate()!)
            _ = readLine()
            print("\n\n\n")
            didLoad()
        case "c", "C":
            let atividades = atividadeGet()
            atividadeView.printAtividade(atividades: atividades)
            atividadeOptions(atividades)
            _ = readLine()
            print("\n\n\n")
            didLoad()
        case "e", "E":
            jsonHandler.postJson(mockAtividades)
        default:
            print( ErrorHandler.opcaoNaoExiste.rawValue)
            didLoad()
        }
    }
    
    func atividadeCreate() -> Atividade? {
        atividadeView.createName()
        
        
        guard let newName: String = readLine() else {
            print(ErrorHandler.nomeVazio.rawValue)
            return atividadeCreate()
        }
        
        if(newName == ""){
            print(ErrorHandler.nomeVazio.rawValue)
            return atividadeCreate()
        }
        
        atividadeView.createDescription()
        guard let newDescription: String = readLine() else {
            print(ErrorHandler.nomeVazio.rawValue)
            return atividadeCreate()
        }
        
        let newAtividade = Atividade(nome: newName, descricao: newDescription, feito: false)
        mockAtividades.tarefas.append(newAtividade)
        return newAtividade
    }
    
    func atividadeGet() -> [Atividade] {
        
        atividadeView.busca()

        guard let searchName: String = readLine() else {
            return []
        }
        
        let listaAtividades = mockAtividades.tarefas
        let listaAtividaesFilter = listaAtividades.filter { $0.nome == searchName}
        
        return listaAtividaesFilter
    }
    
    func atividadeOptions(_ atividades: [Atividade]) {
        atividadeView.opcoesAtividades(quantidade: atividades.count)
        guard let opcao: String = readLine() else {
            return atividadeOptions(atividades)
        }
        guard var indice: Int = Int(opcao) else {
            return didLoad()
        }
        indice -= 1
        if(indice < 0 || indice >= atividades.count) {
            print(ErrorHandler.indiceNaoExiste)
            return atividadeOptions(atividades)
        }
        atividadeView.delete()
        guard let confirmDelete: String = readLine() else {
            return didLoad()
        }
        if(confirmDelete == "s"){
            mockAtividades.tarefas.remove(at: indice)
            didLoad()
        }
    }
    
}
