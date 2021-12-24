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
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFieldAndButtonValue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.username.text = ""
        self.emailOrPhone.text = ""
        self.password.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initializeTextFieldAndButtonValue() {
        nextButton.isEnabled = false
        password.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count > 1 {
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.isEnabled = false
        }
        return true
    }
    
    @IBAction func showPassword(_ sender: Any) {
        // toggle() 메소드는 bool값을 전환시킬 수 있음
        // https://developer.apple.com/documentation/swift/bool/2994863-toggle
        self.password.isSecureTextEntry.toggle()
    }
    
    @IBAction func goToCompletePage(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController else {return}
        
        nextVC.username = self.username.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    func simpleAlert(message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "로그인", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: completion)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension SignUpViewController {
    func requestSignup() {
        UserSignupService.shared.signup(name: username.text ?? "",
                                        email: emailOrPhone.text ?? "",
                                        password: password.text ?? "") { responseData in
            switch responseData {
            case .success(let signupResponse):
                guard let response = signupResponse as? LoginResponseData else { return }
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
