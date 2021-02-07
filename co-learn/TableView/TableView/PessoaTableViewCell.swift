//
//  PessoaTableViewCell.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

class PessoaTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    var pessoa: Pessoa2?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup() {
        self.imageView?.image = pessoa?.image()
        self.nomeLabel.text = pessoa?.title()
    }
}
