//
//  CarrosCollectionViewCell.swift
//  CollectionView
//
//  Created by Felipe Miranda on 08/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


class CarrosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var modeloLabel: UILabel!
    
    @IBOutlet weak var anoLabel: UILabel!
    
    @IBOutlet weak var carroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setupCellCarro(carro: Carro) {
        
        self.modeloLabel.text = carro.modelo
        self.anoLabel.text = carro.ano
        self.carroImageView.image = UIImage(named: carro.image ?? "")
 
    }
    
    
       func setupCellMoto(moto: Moto) {
           
           self.modeloLabel.text = moto.modelo
           self.anoLabel.text = moto.cilindradas
           self.carroImageView.image = UIImage(named: moto.image ?? "")
    
       }

}
