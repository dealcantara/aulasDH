//
//  registerUserVC.swift
//  LoginApp
//
//  Created by Elder Alcantara on 04/02/21.
//

import UIKit
import Firebase

class registerUserVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tappedRegisterUser(_ sender: Any) {
        
        let email: String? = self.emailTextField.text
        let password: String? = self.passwordTextField.text
        
        Auth.auth().createUser(withEmail: email ?? "", password: password ?? "") { authResult, error in
          // ...
        }
    }
    

}
