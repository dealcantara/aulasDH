//
//  CustomView.swift
//  CustomView2
//
//  Created by Elder Alcantara on 19/01/21.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForInterfaceBuilder() {
        self.setupView()
    }
    
    
    func setupView() {
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
    }
    
    @IBInspectable var shadowRadius: CGFloat = 3 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var color: UIColor = .blue {
        didSet {
            self.backgroundColor = color
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 3 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 50 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 5 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .yellow {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    var cicle: Bool = false {
        didSet {
            
            if cicle {
                self.cornerRadius = self.frame.height/2
            }
            
        }
    }
    

}
