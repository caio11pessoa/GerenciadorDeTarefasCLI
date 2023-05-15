//
//  AtividadeView.swift
//  GerenciadorDeTarefas
//
//  Created by userext on 10/05/23.
//

import Foundation

class AtividadeView {
    func menuBoasVindas() {
       print("""
              
              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
              |''''''''''''''''''''''''''''''''''''|`
              |                                    ||
              |                                    ||
              |                                    ||
              |                                    ||
              |                                    ||
              |           Bem vindo ao             ||
              |       Terminal de Tarefas™         ||
              |                                    ||
              |                                    ||
              |                                    ||
              |                                    ||
              |                                    ||
              |                                    ||
              |____________________________________||
              `=====================================`
              
              > Pressione ENTER para começar
              """)
        _ = readLine()
    }
    
    func menuPrincipal() {
      print("""
            
            > O que voce deseja fazer??
            
            [a] - Ver minhas atividades
            [b] - Adicionar atividade
            [c] - Editar atividades
            
            [e] - Sair
            """)
    }
    
    func criarNome() {
      print("""
              
            > Escolha o nome para a sua nova atividade(max: 33 caracteres):
            """)
    }
    
    func criarDescricao() {
      print("""
            > Opcional:
            > Escolha a descrição para a sua nova atividade(max: 100 caracteres):
            """)
    }
    
    func busca() {
      print("""
              
            > Digite o NUMERO da atividade que deseja selecionar:
            > Ou digite qualquer coisa para voltar ao menu.
            """)
    }
    
    func delete() {
      print("""
              
            > A atividade selecionada será apagada para SEMPRE(um longo tempo)
            > Tem certeza que deseja continuar?
              
            [s] -  Sim
            [n] -  Não raleu mofi
            """)
    }
  
    func mostrarAtividade(atividades: [Atividade]){
        let frase = atividades.count == 0 ? "\n> Nenhuma atividade ainda!\n" : "\n> Essas são suas atividades:\n"
        print(frase)
        for atividade in atividades {
          let espaco = "                                     "
          let feitoFrase = atividade.feito ? "Concluida" : "Nao concluida"
          var subDescricoes = [String]()
          var indiceAgora = atividade.descricao.startIndex
          
          for i in 0..<3 {
            let tamanho = (i == 0 ? 33 : 35)
            let indiceFim = atividade.descricao.index(indiceAgora, offsetBy: tamanho, limitedBy: atividade.descricao.endIndex) ?? atividade.descricao.endIndex
            let subdescricao = atividade.descricao[indiceAgora..<indiceFim]
            subDescricoes.append(String(subdescricao))
            indiceAgora = indiceFim
          }

          print("""
                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                |''''''''''''''''''''''''''''''''''''|`
                | -Atividade \(atividade.numero)\(espaco.prefix(max(24 - String(atividade.numero).count,0)))||
                |____________________________________||
                | -\(atividade.nome.prefix(34))\(espaco.prefix(max(34 - atividade.nome.count,0)))||
                |____________________________________||
                | -\(subDescricoes[0].prefix(33))\(espaco.prefix(max(34 - subDescricoes[0].count,0)))||
                |____________________________________||
                | \(subDescricoes[1].prefix(35))\(espaco.prefix(max(35 - subDescricoes[1].count,0)))||
                |____________________________________||
                | \(subDescricoes[2].prefix(35))\(espaco.prefix(max(35 - subDescricoes[2].count,0)))||
                |____________________________________||
                | \(dataHora().prefix(34))\(espaco.prefix(max(35 - dataHora().count,0)))||
                |____________________________________||
                | \(feitoFrase.prefix(34))\(espaco.prefix(max(35 - feitoFrase.count,0)))||
                |____________________________________||
                `=====================================`

                """)
        }
    }
    func opcoesEditar() {
        print("""
                
              > O que voce deseja fazer?
              
              [a] - Editar a atividade
              [b] - Marcar como concluida
              [c] - Deletar atividade
              
              [e] - Sair
              """)
    }
    
    func editar(){
        print("""
              
              > O que voce deseja editar?
              
              [a] - Nome
              [b] - Descricao
              
              [e] - Sair
              """)
    }
    
    func telaEdicao(atributo: String, atributoAntigo: String){
        print("""
              
              > \(atributo) anterior: \(atributoAntigo)
              > Digite o novo valor que deseja:
              """,terminator: "")
    }
    
    func concluir(atividade nome: String){
        print("""
              
              ~ Atividade \(nome) concluída! Parabens!
              """)
    }
    
    func opcoesVer() {
      print("""
              
            > Quais atividades voce deseja ver?
              
            [a] - Todas
            [b] - Concluidas
            [c] - Nao concluidas
            
            [e] - Sair
            """)
    }
    
    func enterParaSeguir(){
      print("> ENTER para continuar. . .", terminator: "")
      _ = readLine()
      print("\n\n\n")
    }

    func dataHora() -> String{
      let formatacao = DateFormatter()
      formatacao.dateFormat = "dd-MM"
      let diaMes = formatacao.string(from: Date())
      formatacao.dateFormat = "HH-mm"
      let horaSegundo = formatacao.string(from: Date())
      return "Criado dia \(diaMes) às \(horaSegundo)"
    }
  
}

