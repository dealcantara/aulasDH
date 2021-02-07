//
//  ViewController.swift
//  CustomView
//
//  Created by Elder Alcantara on 19/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = CustomView(frame: CGRect(x: 100, y: 100, width: 200, height: 300))
        
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        
        self.view.addSubview(view)
        
        // Do any additional setup after loading the view.
    }


}

