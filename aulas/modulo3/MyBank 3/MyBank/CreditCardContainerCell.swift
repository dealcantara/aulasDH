//
//  CreditCardContainerCell.swift
//  MyBank
//
//  Created by Felipe Miranda on 29/10/20.
//

import UIKit

protocol CreditCardContainerCellDelegate: class {
    
    func tappedCreditCard(id: String)
    func tappedButton()
    func tappedButtonGray()
    
}

class CreditCardContainerCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cartoes: Cartoes?

    weak var delegate: CreditCardContainerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: Cartoes?) {
        self.collectionView.register(UINib(nibName: "CreditCardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CreditCardCollectionCell")
        self.collectionView.register(UINib(nibName: "AddCardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AddCardCollectionCell")
        
        self.cartoes = value
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}

extension CreditCardContainerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = self.cartoes?.cartoes.count ?? 0
        return count + 1
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.row < self.cartoes?.cartoes.count ?? 0 {
            
            let cell: CreditCardCollectionCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CreditCardCollectionCell", for: indexPath) as? CreditCardCollectionCell
            cell?.setup(value: self.cartoes?.cartoes[indexPath.row])
            
            return cell ?? UICollectionViewCell()
            
        } else {
            
            let cell: AddCardCollectionCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCardCollectionCell", for: indexPath) as? AddCardCollectionCell
            cell?.setup(delegate: self)
            
            return cell ?? UICollectionViewCell()
            
        }
            
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row < self.cartoes?.cartoes.count ?? 0 {
        
            self.delegate?.tappedCreditCard(id: self.cartoes?.cartoes[indexPath.item].id ?? "")
            
        } else {
            
            self.delegate?.tappedButtonGray()
            
        }
    }
}



extension CreditCardContainerCell: ButtonCollectionCellDelegate {
    
    func tappedButton() {
        
        self.delegate?.tappedButton()
        print("tappedButton")
        
    }
    
    func tappedButtonGray(){
        
        self.delegate?.tappedButtonGray()
        print("tappedButtonGray")
        
    }
    
}
