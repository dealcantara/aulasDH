//
//  ContatosController.swift
//  MvcReview
//
//  Created by Elder Alcantara on 20/10/20.
//

import Foundation


class ContatosController {
    
    private var arrayContatos: [Contato?] = []
    private var contato: Contato?
    
    
    var numberOfRows: Int {
        return self.arrayContatos.count
    }
    
    
    func loadCurrentContato(indexPath: IndexPath){
        self.contato = self.arrayContatos[indexPath.row]
    }
    
    
    var nomeContato: String {
        return self.contato?.nome ?? ""
    }
    var telefoneContato: String {
        return self.contato?.telefone ?? ""
    }
    
    
    func getListContatos(completion: @escaping completion<Bool>) {
        
        ContatosWorker().getListContatos { (arrayContatosDoWorker, error) in
            
            if error == false {
                
                self.arrayContatos = arrayContatosDoWorker
                completion(true,false)
                
            } else {
                
                print("ERRO ContatosController > getListContatos")
                
            }
            
        }
        
    }
    
    
    
    
}
