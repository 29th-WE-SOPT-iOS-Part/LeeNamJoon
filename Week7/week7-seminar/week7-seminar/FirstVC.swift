//
//  FirstVC.swift
//  week7-seminar
//
//  Created by 이남준 on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {

    static let identifier = "FirstVC"
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}
//        nextVC.receivedText = textField.text ?? ""
//        present(nextVC, animated: true) {
//            nextVC.setDataInTextField(data: "이거는 가능?")
//        }
        
        // Segue 방식
//        performSegue(withIdentifier: "presentSecondVC", sender: sender)
        
        // NotificationCenter 방식
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceived),
                                               name: NSNotification.Name("iOS-Sample"),
                                               object: nil)
        
        present(nextVC, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "presentSecondVC" {
//            let nextVC = segue.destination as? SecondVC
//            nextVC?.receivedText = textField.text ?? ""
//        }
//    }
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            textField.text = text
        }
    }
}
