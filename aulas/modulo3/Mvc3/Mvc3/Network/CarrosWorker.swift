//
//  CarrosWorker.swift
//  Mvc3
//
//  Created by Elder Alcantara on 20/10/20.
//

import Foundation

typealias completion <T> = (_ result: T, _ failure: Bool) -> Void

class CarrosWorker {
    
    func getListCarros(completion: @escaping completion<[Carro?]>) {
        
        if let path = Bundle.main.path(forResource: "carros", ofType: "json") {
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

                
                let jsonItemCarregado = jsonResult as? Dictionary <String, AnyObject>
                
                let jsonItemCarro = jsonItemCarregado?["carros"]

                if let jsonCarregado = jsonItemCarro as? [Dictionary <String, AnyObject>] {

                    print("JSON CARREGADO COM SUCESSO! :)")
                    print(jsonCarregado)
                    
                    var carros: [Carro] = []
                    
                    for value in jsonCarregado {
                        let carro = Carro(id: value["ïd"] as? String ?? "",
                                          modelo: value["modelo"] as? String ?? "",
                                          ano: value["ano"] as? Int ?? 0,
                                          cor: value["cor"] as? String ?? "",
                                          imagem: value["image"] as? String ?? "")
                        carros.append(carro)
                    }
                    
                    
                    
//                    if let data = json.data(using: .utf8) {
//                        if let json = try? JSON(data: data) {
//                            for item in json["people"].arrayValue {
//                                print(item["firstName"].stringValue)
//                            }
//                        }
//                    }
                    
                    
                    
                    
                    
                    completion(carros, false)
                    
                }
                
            } catch {
                print("ERRO AO CARREGAR O JSON! :(")
                completion([], true)
            }
            
        }
        
        
    }
    
    
}
