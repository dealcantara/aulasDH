//
//  CreditCardWorker.swift
//  MyBank
//
//  Created by Elder Alcantara on 05/11/20.
//

import Foundation


class CreditCardWorker {
    
    func loadCreditCard() -> Cartoes? {
        
        if let path = Bundle.main.path(forResource: "cartoes", ofType: "json") {
            
            do {
                
                let data  = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let cartoes = try JSONDecoder().decode(Cartoes.self, from: data)
                
                print(cartoes)
                
                return cartoes
                
            } catch {
                
                print("ERRO NO PARSE!")
                
            }
        }
        
        return nil
        
    }
    
}
