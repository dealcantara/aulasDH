//
//  ContatosWorker.swift
//  Mvc2
//
//  Created by Elder Alcantara on 08/10/20.
//

import Foundation

typealias completion <T> = (_ result: T, _ failure: Bool) -> Void

class ContatosWorker {
    
    func getListContatos(completion: @escaping completion<[Contato?]>) {
        
        if let path = Bundle.main.path(forResource: "contatos", ofType: "json") {
            
            do {
                
                let data  = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonCarregado = jsonResult as? [Dictionary<String, AnyObject>] {
                    
                    print("Deu bom... Carregamos o nosso JSON")
                    print(jsonCarregado)
                    
                    var contatos: [Contato] = []
                    
                    for value in jsonCarregado {
                        
                        let contato = Contato(nome: value["nome"] as? String ?? "", telefone: value["telefone"] as? String ?? "")
                        print("Nome: \(contato.nome) // Telefone: \(contato.telefone) \n\n")
                        contatos.append(contato)

                    }
                    
                    
//                    for value in  jsonCarregado {
//
//                        let contato = Contato(nome: value["nome"] as? String, telefone: value["telefone"] as? String)
//                        print("objetos contato:\(contato.nome)..... \(contato.telefone)\n\n")
//                        contatos.append(contato)
//
//                    }
                    
                    
                    completion(contatos, false)
                }
                
            } catch {
                
                print("Deu ruim!")
                completion([], true)
                
            }
            
            
        }
        
    }
    
}
