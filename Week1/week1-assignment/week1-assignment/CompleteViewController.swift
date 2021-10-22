//
//  CompleteViewController.swift
//  week1-assignment
//
//  Created by 이남준 on 2021/10/09.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUsernameInLabel()
    }
    
    func setUsernameInLabel() {
        if let name = username {
            usernameLabel.text = "\(name)님\n 환영합니다!"
            usernameLabel.sizeToFit()
        }
    }
    
    @IBAction func confirm(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
