//
//  ListaCarrosController.swift
//  MVC
//
//  Created by Elder Alcantara on 01/10/20.
//

import Foundation


class ListaCarrosController {
    
    
    var arrayCarros:[Carro] = [Carro(modelo: "Civic", ano: 2000, cor: "Preto"), Carro(modelo: "Corcel", ano: 1980, cor: "Vermelho"), Carro(modelo: "Fusca", ano: 2020, cor: "Azul"), Carro(modelo: "Mustang", ano: 2019, cor: "Preto"), Carro(modelo: "C250", ano: 2020, cor: "Branco")]


    var arrayCarrosCount: Int {

        return self.arrayCarros.count

    }
    
    func modeloCarro(indexPath: IndexPath) -> String {
        
        return arrayCarros[indexPath.row].modelo ?? ""
        
    }
    
    func anoCarro(indexPath: IndexPath) -> String {
        
        return "\(arrayCarros[indexPath.row].ano ?? 0)"
        
    }
    
    func corCarro(indexPath: IndexPath) -> String {
        
        return arrayCarros[indexPath.row].cor ?? ""
        
    }
    
    
    private var carroSorteado: Carro?
    
    var modeloCarroSorteado: String? {
        return self.carroSorteado?.modelo
    }
    var anoCarroSorteado: String? {
        return "\(self.carroSorteado?.ano ?? 0)"
    }
    var corCarroSorteado: String? {
        return self.carroSorteado?.cor
    }
    
    
    func sortearCarro() -> String {
        
        let sorteado: Carro = self.arrayCarros.randomElement() ?? Carro(modelo: "", ano: 0, cor: "")
        
        let modelo: String = sorteado.modelo ?? ""
        let ano: Int = sorteado.ano ?? 0
        let cor: String = sorteado.cor ?? ""
        
        self.carroSorteado = sorteado
        
        return "\(modelo), \(ano), \(cor)"
    }
    
    
}
