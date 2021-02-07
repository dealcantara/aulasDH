//
//  CarrorWorker.swift
//  ListaCarros
//
//  Created by Felipe Miranda on 20/10/20.
//

import Foundation


class CarrosWorker {
    
    func getListCarros( completion:(Carro?, Bool) -> Void) {
        
        if let path = Bundle.main.path(forResource: "carros", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeObject = try JSONDecoder().decode(Carro.self, from: data)
                
                print(decodeObject)
                
                completion(decodeObject, false)
                
            }catch {
                completion(nil,true)
            }
        }
    }
}
