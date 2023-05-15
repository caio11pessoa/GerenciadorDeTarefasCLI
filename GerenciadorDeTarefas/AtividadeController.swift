//
//  AtividadeController.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeController {
    let atividadeView: AtividadeView = AtividadeView()
    
    lazy var listaDeAtividades: ListaAtividades = {
        guard let atividades = jsonHandler.getJson() else {
            return ListaAtividades(tarefas: [])
        }
        return atividades
    }()
    
    let jsonHandler = JsonHandler()
    
    func inicio() {
        
        atividadeView.menuPrincipal()
        guard let acao: String = readLine() else {
            return inicio()
        }
        switch acao {
        case "a","A":
            atividadeView.opcoesVer()
            verTarefas()
            atividadeView.enterParaSeguir()
            inicio()
        case "b", "B":
            guard let tarefa = criarNovaAtividade() else {
                print(ErrorHandler.arquivoCorrompido)
                return inicio()
            }
            atividadeView.mostrarAtividade(atividades: [tarefa])
            jsonHandler.postJson(listaDeAtividades)
            atividadeView.enterParaSeguir()
            inicio()
        case "c", "C":
            atividadeView.mostrarAtividade(atividades: listaDeAtividades.tarefas)
            atividadeView.busca()
            let indice = acharIndiceAtividade()
            atividadeAcoes(indice)
            jsonHandler.postJson(listaDeAtividades)
            atividadeView.enterParaSeguir()
            inicio()
        case "e", "E":
            jsonHandler.postJson(listaDeAtividades)
            print("Adeus :c")
            return
        default:
            print( ErrorHandler.opcaoNaoExiste.rawValue)
            inicio()
        }
    }
    
    func criarNovaAtividade() -> Atividade? {
        atividadeView.criarNome()
        
        guard let novoNome: String = readLine() else {
            print(ErrorHandler.nomeVazio.rawValue)
            return criarNovaAtividade()
        }
        
        if(novoNome == ""){
            print(ErrorHandler.nomeVazio.rawValue)
            return criarNovaAtividade()
        }
        
        atividadeView.criarDescricao()
        guard let novaDescricao: String = readLine() else {
            print(ErrorHandler.nomeVazio.rawValue)
            return criarNovaAtividade()
        }
        
        let newAtividade = Atividade(numero: listaDeAtividades.tarefas.count + 1 ,nome: novoNome, descricao: novaDescricao, feito: false)
        listaDeAtividades.tarefas.append(newAtividade)
        return newAtividade
    }
    
    func acharIndiceAtividade() -> Int{
        while(true){
            guard let numeroString = readLine() else {
                continue
            }
            guard let numeroAchar: Int = Int(numeroString) else{
                inicio()
                continue
            }
            guard let indice: Int = listaDeAtividades.tarefas.firstIndex(where: { $0.numero == numeroAchar}) else{
                print("\n! Numero invalido !")
                continue
            }
            return indice
        }
    }
    func atividadeAcoes(_ indice: Int){
        atividadeView.opcoesEditar()
        
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
            inicio()
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
            inicio()
        default:
            print(ErrorHandler.opcaoNaoExiste.rawValue)
            return editarTarefa(indice)
        }
        print("\n> Tarefa editada com sucesso!")
    }
    
    func concluir(atividade indice:Int ){
        listaDeAtividades.tarefas[indice].feito.toggle()
        atividadeView.concluir(atividade: listaDeAtividades.tarefas[indice].nome)
        atividadeAcoes(indice)
    }
    
    func deletar(atividade indice:Int) {
        atividadeView.delete()
        guard let confirmarDelete: String = readLine() else {
            return deletar(atividade: indice )
        }
        if(confirmarDelete == "s" || confirmarDelete == "S"){
            listaDeAtividades.tarefas.remove(at: indice)
            print("> Atividade deletada com sucesso")
            darNumero()
            inicio()
        } else if(confirmarDelete == "n" || confirmarDelete == "N"){
            print("> Operacao cancelada")
            atividadeAcoes(indice)
        } else {
            print(ErrorHandler.opcaoNaoExiste.rawValue)
            deletar(atividade: indice)
        }
    }
    
    func verTarefas(){
        guard let acao: String = readLine() else {
            return verTarefas()
        }
        switch acao{
        case "a", "A":
            atividadeView.mostrarAtividade(atividades: listaDeAtividades.tarefas)
        case "b", "B":
            let atividadesCompletas = listaDeAtividades.tarefas.filter({$0.feito})
            atividadeView.mostrarAtividade(atividades: atividadesCompletas)
        case "c", "C":
            let atividadesNaoCompletas = listaDeAtividades.tarefas.filter({!$0.feito})
            atividadeView.mostrarAtividade(atividades: atividadesNaoCompletas)
        case "e", "E":
            inicio()
        default:
            print(ErrorHandler.opcaoNaoExiste)
            verTarefas()
        }
    }
    
    func darNumero() {
        for i in 0..<listaDeAtividades.tarefas.count{
            listaDeAtividades.tarefas[i].numero = i+1
        }
    }
    
}
