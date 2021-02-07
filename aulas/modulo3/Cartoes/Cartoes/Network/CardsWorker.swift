//
//  CardsWorker.swift
//  Cartoes
//
//  Created by Elder Alcantara on 27/10/20.
//

import Foundation


class CardsWorker {
    
    func getListCards ( completion:(Card?, Bool) -> Void) {
        
        if let path = Bundle.main.path(forResource: "cartoes", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeObject = try JSONDecoder().decode(Card.self, from: data)
                
                print(decodeObject)
                
                completion(decodeObject, false)
                
            } catch {
                
                print("Erro ao carregar o JSON! :(")
                completion(nil,true)
                
            }
        }
        
    }
    
    
}
