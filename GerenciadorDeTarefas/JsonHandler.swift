//
//  JsonHandler.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 11/05/23.
//

import Foundation

class JsonHandler {

    let (jsonURL, fileManager): (URL, FileManager) = {
        let fileManager = FileManager.default
        let nomeJson = "tarefas.json"
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let jsonUrl = documentsURL.appendingPathComponent(nomeJson)
        
        return (jsonUrl, fileManager)
    }()

    func getJson() -> ListaAtividades? {
        
        if fileManager.fileExists(atPath: jsonURL.path){
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let decoder = JSONDecoder()
                let atividade = try decoder.decode(ListaAtividades.self, from: jsonData)
                return atividade
            } catch {
                print(ErrorHandler.arquivoCorrompido.rawValue)
                return nil
           }
        } else {
            do {
                try "".write(to: jsonURL, atomically: true, encoding: .utf8)
                return ListaAtividades(tarefas:[])
            } catch {
                return nil
            }
        }
    }

    
    func postJson(_ atividades : ListaAtividades) {
        do {
            let data = try JSONEncoder().encode(atividades)
            try data.write(to: jsonURL)
        } catch {
            return
        }
    }
}
