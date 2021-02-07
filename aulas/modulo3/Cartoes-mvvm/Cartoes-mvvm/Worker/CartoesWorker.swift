//
//  CartoesWorker.swift
//  Cartoes-mvvm
//
//  Created by Elder Alcantara on 27/10/20.
//

import Foundation


class CartoesWorker {
    typealias completion <T> = (_ result: T, _ failure: Bool?) -> Void
    
    func loadCreditCard(completion: @escaping completion<[CartoesElement]?>) {
        
        if let path = Bundle.main.path(forResource: "cartoes", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let cartoes = try JSONDecoder().decode(Cartoes.self, from: data)
                
                print(cartoes)
                
                completion(cartoes.cartoes, nil)
                
            } catch {
                
                print("Erro ao carregar o JSON! :(")
                completion(nil, false)
                
            }
            
        }
        
        
    }
    
    
}
