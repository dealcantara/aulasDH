//
//  ExtratoVM.swift
//  MyBank
//
//  Created by Felipe Miranda on 03/11/20.
//

import Foundation

enum TipoLancamentoElement: String {
    
    case s = "S"
    case e = "E"
}

class ExtratoVM {
    
    private var movimentacao: Movimentacao?
    
    private var worker: ExtratoWorker = ExtratoWorker()
    
    private var currentLancamentoElement: LancamentoElement?
    
    
    typealias  completion <T> = (_ result: T, _ failure: String?) -> Void
    
    func loadExtrato(completion: @escaping completion<Bool>) {
        
        self.worker.loadExtrato { (response, error) in
            
            if let _response = response {
                
                self.movimentacao = _response
                completion(true, nil)
                
            } else {
                
                completion(false, error)
                
            }
            
        }
        
    }
    
    

    
    func loadCurrentLancamentoElement(index: IndexPath) {
        self.currentLancamentoElement = movimentacao?.lancamentos[index.row]
    }
    
    var id: String {
        return self.currentLancamentoElement?.id ?? ""
    }
    
    var nome: String {
        return self.currentLancamentoElement?.nome ?? ""
    }
    
    var data:String {
        return self.currentLancamentoElement?.data ?? ""
    }
    
    var valor:String{
        return "R$ \(String(format: "%.2f", self.currentLancamentoElement?.valor ?? 0))"
    }
    
    var tipo: TipoLancamentoElement {
        return TipoLancamentoElement(rawValue: (self.currentLancamentoElement?.tipo) ?? "") ?? .s
    }
    
    var numberOfRows: Int {
        return self.movimentacao?.lancamentos.count ?? 0
    }
    
}
