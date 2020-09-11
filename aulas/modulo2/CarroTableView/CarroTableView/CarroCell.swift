//
//  CarroCell.swift
//  CarroTableView
//
//  Created by Felipe Miranda on 03/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class CarroCell: UITableViewCell {

    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var corLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setupCell(carro:Carro) {
        
        self.modeloLabel.text = carro.modelo
        self.anoLabel.text = carro.ano
        self.corLabel.text = carro.cor
        self.kmLabel.text = "\(carro.km ?? 0)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
