//
//  InvoiceWorker.swift
//  MyBank
//
//  Created by Elder Alcantara on 03/12/20.
//

import Foundation
import Alamofire

class InvoiceWorker {
    
    typealias completion <T> = (_ result: T, _ failure: String?) -> Void
    
    func getInvoice(cardId: String, completion: @escaping completion<CardListElement?>) {
        
        AF.request("https://api.mocki.io/v1/7bc5b2b0", method: .get).responseData { (response) in
            
            switch response.result {
            
            case .failure(let error):
                completion(nil, #function)
                print(error.localizedDescription)
                
            case .success(let data):
                let listInvoice = try? JSONDecoder().decode(CardList.self, from: data)
                
                if let _listInvoice = listInvoice?.cardList {

                    let cardElement = _listInvoice.filter({$0.cardID == cardId})
                    completion(cardElement.first, nil)

                } else {

                    completion(nil, #function)
                }
            
            }
            
            
        }
    
    
    }
    
    
    
    
    
    
// CHAMADA DE API NATIVA SWIFT
    
//    typealias completion <T> = (_ result: T, _ failure: String?) -> Void
//
//    func getInvoice(cardId: String, completion: @escaping completion<CardListElement?>) {
//
//        let session: URLSession = URLSession.shared
//        let url: URL? = URL(string: "https://api.mocki.io/v1/7bc5b2b0")
//
//        if let _url = url {
//
//            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error) in
//
//                do {
//
//                    let listInvoice = try JSONDecoder().decode(CardList.self, from: data ?? Data())
//
//                    if let _listInvoice = listInvoice.cardList {
//
//                        let cardElement = _listInvoice.filter({$0.cardID == cardId})
//                        completion(cardElement.first, nil)
//
//                    } else {
//
//                        completion(nil, "Deu erro! (InvoiceWorker)")
//                    }
//
//                } catch {
//
//                    completion(nil, "Deu erro no CATCH! (InvoiceWorker)")
//
//                }
//
//            }
//
//            task.resume()
//
//        }
//
//    }
    
    
}
