//
//  AtividadeController.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeController {
    let atividadeView: AtividadeView = AtividadeView()

    var mockAtividades: ListaAtividades = ListaAtividades(ativdades: [Atividade(nome: "Ian", descricao: "Colocar racao no pote", feito: false), Atividade(nome: "Ian", descricao: "Vai ao banheiro pow", feito: false), Atividade(nome: "Dar comida pro Hamseter", descricao: "Colocar racao na garagem", feito: false)])
    
    func didLoad() {
        
        atividadeView.display()
        guard let acao: String = readLine() else {
            return
        }
        switch acao {
        case "a","A":
            //TODO:: Formatar bonitinho
            print(mockAtividades.ativdades)
            _ = readLine()
            print("\n\n\n")
            
            didLoad()
        case "b", "B":
            print(atividadeCreate()!)
            _ = readLine()
            print("\n\n\n")
            didLoad()
        case "c", "C":
            let atividades = atividadeGet()
            print(atividades)
            atividadeOptions(atividades)
            _ = readLine()
            print("\n\n\n")
            didLoad()
        default:
            print("Def")
        }
    }
    
    func atividadeCreate() -> Atividade? {
        atividadeView.createName()
        guard let newName: String = readLine() else {
            //Lidar com erros aqui
            return nil
        }
        atividadeView.createDescription()
        guard let newDescription: String = readLine() else {
            //Lidar com erros aqui
            return nil
        }
//        atividadeView.createData()
//        guard let newData: String = readLine() else {
//            //Lidar com erros aqui
//            return nil
//        }
        
        let newAtividade = Atividade(nome: newName, descricao: newDescription, feito: false)
        mockAtividades.ativdades.append(newAtividade)
        return newAtividade
    }
    
    func atividadeGet() -> [Atividade] {
        
        atividadeView.busca()

        guard let searchName: String = readLine() else {
            return []
        }
        
        let listaAtividades = mockAtividades.ativdades
        let listaAtividaesFilter = listaAtividades.filter { $0.nome == searchName}
        
        return listaAtividaesFilter
    }
    
    func atividadeOptions(_ atividades: [Atividade]) {
        atividadeView.opcoesAtividades(quantidade: atividades.count)
        guard let opcao: String = readLine() else {
            return
        }
        guard var indice: Int = Int(opcao) else {
            print("Boa garotão")
            return
        }
        indice -= 1
        if(indice < 0 || indice >= atividades.count) {
            print("Adeus")
            return
        }
        atividadeView.delete()
        guard let confirmDelete: String = readLine() else {
            return
        }
        if(confirmDelete == "s"){
            mockAtividades.ativdades.remove(at: indice)
        }
    }
    
}
