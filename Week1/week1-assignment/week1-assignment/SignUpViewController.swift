//
//  SignUpViewController.swift
//  week1-assignment
//
//  Created by 이남준 on 2021/10/09.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailOrPhone: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func showPassword(_ sender: Any) {
        
    }
    
    @IBAction func goToCompletePage(_ sender: Any) {
        
    }
    
}
