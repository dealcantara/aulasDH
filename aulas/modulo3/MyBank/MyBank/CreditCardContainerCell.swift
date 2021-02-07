//
//  CredtCardContainerCell.swift
//  MyBank
//
//  Created by Elder Alcantara on 29/10/20.
//

import UIKit


protocol CreditCardContainerCellDelegate: class {
    func tappedCreditCard(id: String)
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
    
    func setup(value: Cartoes?){
        
        self.collectionView.register(UINib(nibName: "CreditCardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CreditCardCollectionCell")
        
        self.cartoes = value
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
}


extension CreditCardContainerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.cartoes?.cartoes.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CreditCardCollectionCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CreditCardCollectionCell", for: indexPath) as? CreditCardCollectionCell
        
        cell?.setup(value: self.cartoes?.cartoes[indexPath.row])
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.tappedCreditCard(id: self.cartoes?.cartoes[indexPath.item].id ?? "")
    }
    
    
}
