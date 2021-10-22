//
//  LoginViewController.swift
//  week1-assignment
//
//  Created by 이남준 on 2021/10/09.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailOrPhone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        password.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.username.text = ""
        self.emailOrPhone.text = ""
        self.password.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count > 1 {
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.isEnabled = false
        }
        return true
    }
    
    @IBAction func registerNewAccount(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func goToSuccessPage(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController else {return}
        
        nextVC.username = self.username.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
