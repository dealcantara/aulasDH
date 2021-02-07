//
//  CarroProvider.swift
//  ListaCarros
//
//  Created by Felipe Miranda on 20/10/20.
//

import Foundation



class CarroProvider {
    
    private var response: Carro?
        
    var currentCarro: CarroElement?

    var modelo: String {
        return self.currentCarro?.modelo ?? ""
    }
    
    var ano: String {
        return String(self.currentCarro?.ano ?? 0)
    }
    
    func loadCurrentCarro(index: Int) {
        self.currentCarro = self.response?.carros[index]
    }
    
    var count:  Int {
        return  response?.carros.count ?? 0
    }
    
    func getListCarros(completion: (Bool) -> Void ) {
        
        CarrosWorker().getListCarros { (success, error) in
            
            if error == false {
                self.response = success
                
                completion(true)
            }else {
                completion(false)
                print("Deu ruim na hora do parse do JSON")
            }
        }
    }
    
}
