//
//  LoginViewController.swift
//  week1-assignment
//
//  Created by 이남준 on 2021/10/09.
//

import UIKit
import Alamofire

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
        print(nextVC)
        self.navigationController?.pushViewController(nextVC, animated: true) // 하 이거 왜 안되는거야 빡치게
    }
    
    @IBAction func goToSuccessPage(_ sender: Any) {
        requestLogin()
    }
    
    func simpleAlert(message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "로그인", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: completion)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController {
    func requestLogin() {
        UserLoginService.shared.login(email: emailOrPhone.text ?? "",
                                      password: password.text ?? "") { responseData in
            
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else {return}
                self.simpleAlert(message: response.message) { _ in
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController else { return }
                    
                    nextVC.username = self.username.text
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true, completion: nil)
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
                guard let message = msg as? String else {return}
                self.simpleAlert(message: message, completion: nil)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
