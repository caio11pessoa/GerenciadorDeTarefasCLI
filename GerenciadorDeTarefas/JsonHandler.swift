//
//  JsonHandler.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 11/05/23.
//

import Foundation
class JsonHandler {
    let fileManager = FileManager.default
    
    func getJson() -> ListaAtividades?{
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let fileURL = documentDirectory.appendingPathComponent("tarefas.json")
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let atividade = try decoder.decode(ListaAtividades.self, from: jsonData)
            return atividade
        }catch {
            fatalError("Error Fatal")
        }
        
    }
    
    func postJson(_ atividades : ListaAtividades) {
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileURL = documentDirectory.appendingPathComponent("tarefas.json")
        print(fileURL)
        let data = try! JSONEncoder().encode(atividades)
        print(data)
        do{
            try! data.write(to: fileURL)
        }
    }
}

