//
//  CarrosController.swift
//  Mvc3
//
//  Created by Elder Alcantara on 20/10/20.
//

import Foundation

class CarrosController {
    
    
    private var arrayCarros: [Carro?] = []
    private var carro: Carro?
    
    var numberOfRows: Int {
        return self.arrayCarros.count
    }
    
    func loadCurrentCarro(indexPath: IndexPath) {
        self.carro = self.arrayCarros[indexPath.row]
    }
    
   
    var idCarro: String {
        return self.carro?.id ?? ""
    }
    var modeloCarro: String {
        return self.carro?.modelo ?? ""
    }
    var anoCarro: String {
        return String(self.carro?.ano ?? 0)
    }
    var corCarro: String {
        return self.carro?.cor ?? ""
    }
    var imageCarro: String {
        return self.carro?.imagem ?? ""
    }
    
    
    func getListCarros(completion: @escaping completion<Bool>) {
        
        CarrosWorker().getListCarros { (arrayCarrosDoWorker, error) in
            
            if error == false {
                
                self.arrayCarros = arrayCarrosDoWorker
                completion(true, false)
            } else {
                
                print("ERRO CarrosController > getListCarros")
            }
            
            
        }
        
    }
    
    
}
