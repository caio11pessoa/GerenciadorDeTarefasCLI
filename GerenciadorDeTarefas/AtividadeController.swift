//
//  AtividadeController.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeController {
    let atividadeView: AtividadeView = AtividadeView()

    //TODO tirar o force
    lazy var listaDeAtividades: ListaAtividades = {
        guard let atividades = jsonHandler.getJson() else {
            return ListaAtividades(tarefas: [])
        }
        return atividades
    }()
        
    let jsonHandler = JsonHandler()
    
    func didLoad() {
       
        atividadeView.display()
        guard let acao: String = readLine() else {
            return didLoad()
        }
        switch acao {
        case "a","A":
            atividadeView.opcoesVer()
            verTarefas()
            atividadeView.pressToContinue()
            didLoad()
        case "b", "B":
            guard let tarefa = atividadeCreate() else {
                print(ErrorHandler.arquivoCorrompido)
                return didLoad()
            }
            atividadeView.printAtividade(atividades: [tarefa])

            atividadeView.pressToContinue()
            didLoad()
        case "c", "C":
            let atividades = atividadeGet()
            atividadeView.printAtividade(atividades: atividades)
            atividadeOptions(atividades)
            atividadeView.pressToContinue()
            didLoad()
        case "e", "E":
            jsonHandler.postJson(listaDeAtividades)
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
        listaDeAtividades.tarefas.append(newAtividade)
        return newAtividade
    }
    
    func atividadeGet() -> [Atividade] {
        
        atividadeView.busca()

        guard let searchName: String = readLine() else {
            return []
        }
        
        let listaAtividades = listaDeAtividades.tarefas
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
        atividadeAcoes(indice)
        
    }
    func atividadeAcoes(_ indice: Int){
        atividadeView.options()
        
        guard let acao: String = readLine() else {
            return atividadeAcoes(indice)
        }
        switch acao {
        case "a", "A":
            editarTarefa(indice)
        case "b", "B":
            concluir(atividade: indice)
        case "c", "C":
            deletar(atividade: indice)
        case "e", "E":
            didLoad()
        default:
            print(ErrorHandler.opcaoNaoExiste.rawValue)
            return atividadeAcoes(indice)
        }
        
    }
    func editarTarefa(_ indice: Int) {
        atividadeView.editar()
        
        guard let acao: String = readLine() else {
            return editarTarefa(indice)
        }
        switch acao {
        case "a", "A":
            atividadeView.telaEdicao(atributo: "Nome", atributoAntigo: listaDeAtividades.tarefas[indice].nome)
            guard let novoNome: String = readLine() else {
                return editarTarefa(indice)
            }
            listaDeAtividades.tarefas[indice].nome = novoNome
        case "b", "B":
            atividadeView.telaEdicao(atributo: "Descrição", atributoAntigo: listaDeAtividades.tarefas[indice].descricao)
            guard let novaDescricao: String = readLine() else {
                return editarTarefa(indice)
            }
            listaDeAtividades.tarefas[indice].descricao = novaDescricao
        case "e", "E":
            didLoad()
        default:
            print(ErrorHandler.opcaoNaoExiste.rawValue)
            return editarTarefa(indice)
        }
    }
    
    func concluir(atividade indice:Int ){
        listaDeAtividades.tarefas[indice].feito.toggle()
        atividadeView.concluir(atividade: listaDeAtividades.tarefas[indice].nome)
        atividadeAcoes(indice)
    }
    
    func deletar(atividade indice:Int) {
                atividadeView.delete()
                guard let confirmDelete: String = readLine() else {
                    return deletar(atividade: indice )
                }
                if(confirmDelete == "s"){
                    listaDeAtividades.tarefas.remove(at: indice)
                    print("Atividade deletada com sucesso")
                    didLoad()
                }
    }
    
    func verTarefas(){
        guard let acao: String = readLine() else {
            return verTarefas()
        }
        switch acao{
        case "a", "A":
            atividadeView.printAtividade(atividades: listaDeAtividades.tarefas)
        case "b", "B":
            let atividadesCompletas = listaDeAtividades.tarefas.filter({$0.feito})
            atividadeView.printAtividade(atividades: atividadesCompletas)
        case "c", "C":
            let atividadesNaoCompletas = listaDeAtividades.tarefas.filter({!$0.feito})
            atividadeView.printAtividade(atividades: atividadesNaoCompletas)
        default:
            print(ErrorHandler.opcaoNaoExiste)
            verTarefas()
        }
    }
}
