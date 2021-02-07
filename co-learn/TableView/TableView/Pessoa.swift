//
//  TipoPessoa.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

protocol Pessoa {
    var nome: String { get set }
    var foto: String { get set }
}

protocol Pessoa2 {
    func title() -> String
    func image() -> UIImage
}
