//
//  FaturaWorker.swift
//  MyBank
//
//  Created by Elder Alcantara on 05/11/20.
//

import Foundation

class InvoiceWorker {
    
    func loadListElement() -> Invoice? {
        
        if let path = Bundle.main.path(forResource: "invoice", ofType: "json") {
            
            do {
                
                let data  = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let value = try JSONDecoder().decode(Invoice.self, from: data)
                print(value)
                return value
                
            } catch {
                
                print(">>> ERRO NO PARSE!")
                
            }
        }
        
        return nil
        
    }
    
}
