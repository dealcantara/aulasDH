//
//  ContatosWorker.swift
//  MvcReview
//
//  Created by Elder Alcantara on 20/10/20.
//

import Foundation

typealias completion <T> = (_ result: T, _ failure: Bool) -> Void

class ContatosWorker {
    
    
    func getListContatos(completion: @escaping completion<[Contato?]>){
        
        if let path = Bundle.main.path(forResource: "contatos", ofType: "json"){
            
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonCarregado = jsonResult as? [Dictionary<String, AnyObject>] {
                    
                    print("JSON CARREGADO COM SUCESSO! :)")
                    print(jsonCarregado)
                    
                    var contatos: [Contato] = []
                    
                    
                    for value in jsonCarregado {
                        
                        let contato = Contato(nome: value["nome"] as? String ?? "", telefone: value["telefone"] as? String ?? "")
                        contatos.append(contato)
                        
                    }
                    
                    completion(contatos,false)
                }
                
            } catch {
                
                print("ERRO AO CARREGAR O JSON! :(")
                completion([], true)
                
            }
            
        }
    }
    
}




