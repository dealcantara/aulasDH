//
//  CreditCardWorker.swift
//  MyBank
//
//  Created by Elder Alcantara on 05/11/20.
//

import Foundation
import Alamofire

class CreditCardWorker {
    
    typealias completion <T> = (_ result: T, _ failure: String?) -> Void
    
    func getCreditCard(completion: @escaping completion<Cartoes?>) {
        
        AF.request("https://api.mocki.io/v1/e392e75c", method: .get).responseData { (response) in
            
            switch response.result {
                
            case .failure(let error):
                completion(nil, "Deu ruim no catch! (CreditCardWorker)")
                print(error.localizedDescription)
                
            case .success(let data):
                let cards = try? JSONDecoder().decode(Cartoes.self, from: data)
                completion(cards, nil)
            
            }
            
        }
        
    }
    
    
    
    
// CHAMADA DE API NATIVA SWIFT

//    typealias completion <T> = (_ result: T, _ failure: String?) -> Void
//
//    func getCreditCard(completion: @escaping completion<Cartoes?>) {
//
//        let session: URLSession = URLSession.shared
//
//        let url: URL? = URL(string: "https://api.mocki.io/v1/e392e75c")
//
//        if let _url = url {
//
//            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error) in
//
//                do {
//
//                    let listCreditCard = try JSONDecoder().decode(Cartoes.self, from: data ?? Data())
//
//                    completion(listCreditCard, nil)
//
//
//
//                } catch {
//
//                    completion(nil, "Deu ruim no catch! (CreditCardWorker)")
//
//                }
//
//
//            }
//
//            task.resume()
//
//        }
//
//    }
    
    
}
