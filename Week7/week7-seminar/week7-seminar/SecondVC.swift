//
//  SecondVC.swift
//  week7-seminar
//
//  Created by 이남준 on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {

    static let identifier = "SecondVC"
    @IBOutlet weak var textField: UITextField!
    var receivedText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = receivedText
    }
    @IBAction func touchUpToSendData(_ sender: Any) {
//        let presentingVC = presentingViewController as? FirstVC
//        presentingVC?.textField.text = textField.text
//        dismiss(animated: true, completion: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"),
                                        object: textField.text ?? "")
        
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textField.text = textField.text
        dismiss(animated: true, completion: nil)
    }
    
    func setDataInTextField(data: String) {
        textField.text = data
    }
}
