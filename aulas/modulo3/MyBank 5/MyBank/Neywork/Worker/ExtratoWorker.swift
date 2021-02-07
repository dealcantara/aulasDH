//
//  ExtratoWorker.swift
//  MyBank
//
//  Created by Elder Alcantara on 05/11/20.
//

import Foundation
import Alamofire

class ExtratoWorker {
    
    typealias completion <T> = (_ result: T, _ failure: String?) -> Void
    
    func loadExtrato(completion: @escaping completion<Movimentacao?>) {
    
        AF.request("https://api.mocki.io/v1/60bd95e0", method: .get).responseData { (response) in
            
            switch response.result {
            
            case .failure(let error):
                completion(nil, #function)
                print(error.localizedDescription)
            
            case .success(let data):
                let extract = try? JSONDecoder().decode(Movimentacao.self, from: data)
                completion(extract, nil)
            
            }
            
        }
    
    }
        
    
//    func loadExtrato() -> Movimentacao? {
//
//        if let path = Bundle.main.path(forResource: "despesas", ofType: "json"){
//
//            do {
//
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//
//                let value = try JSONDecoder().decode(Movimentacao.self, from: data)
//
//                print("=======>value\(value)")
//
//               return  value
//
//            }catch{
//                print("Deu ruim no parse")
//
//            }
//
//        }
//        return nil
//
//    }
}




