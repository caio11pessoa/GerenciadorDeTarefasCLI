//
//  AtividadeController.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeController {
    init() {
        print("Ola estamos no controller!!")
        let atividadeView = AtividadeView()
        atividadeView.display()
        guard let acao: String = readLine() else {
            return
        }
        switch acao {
        case "a","A":
            print("A")
        default:
            print("Def")
        }
    }
}
