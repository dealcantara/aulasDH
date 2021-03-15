//
//  ListTableViewCell.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quantLabel: UILabel!
    @IBOutlet weak var produtoLabel: UILabel!
    @IBOutlet weak var cifraoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    func setup(item:ListItem?) {
        
        if let _item = item {
            self.quantLabel.text = String(_item.quantity ?? 0)
            self.produtoLabel.text = _item.product
            self.priceLabel.text = String(_item.price ?? 0.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
