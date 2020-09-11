//
//  sectionHeaderCollectionReusableView.swift
//  CollectionView
//
//  Created by Felipe Miranda on 10/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


class SectionHeader: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var teste: String = ""
    
    override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
    }
     
}
