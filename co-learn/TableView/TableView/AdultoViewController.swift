//
//  AdultoViewController.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

class AdultoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var profissaoLabel: UILabel!
    
    var pessoa: Adulto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        imageView.image = UIImage(named: pessoa!.foto)
        nomeLabel.text = pessoa?.nome
        idadeLabel.text = pessoa?.idade.description
        profissaoLabel.text = pessoa?.profissao
        
    }
}
