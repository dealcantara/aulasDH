//
//  Despesas.swift
//  MyBank
//
//  Created by Elder Alcantara on 03/11/20.
//

import Foundation

struct Movimentacao: Codable {
    let lancamentos: [LancamentoElement]
}

struct LancamentoElement: Codable {
    let id, nome, data, tipo: String
    let valor: Double
}
