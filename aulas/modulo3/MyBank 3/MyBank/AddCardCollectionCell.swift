//
//  AddCardCollectionCell.swift
//  MyBank
//
//  Created by Elder Alcantara on 10/11/20.
//

import UIKit

protocol ButtonCollectionCellDelegate: class {
    
    func tappedButton()
    
}


class AddCardCollectionCell: UICollectionViewCell {

    
    private weak var delegate: ButtonCollectionCellDelegate?
    @IBOutlet weak var addButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func setup(delegate:ButtonCollectionCellDelegate?){
        self.delegate = delegate
    }

    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        self.delegate?.tappedButton()
    }
    
    
}
