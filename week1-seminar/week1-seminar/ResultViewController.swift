//
//  ResultViewController.swift
//  week1-seminar
//
//  Created by 이남준 on 2021/10/04.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
        // Do any additional setup after loading the view.
    }
    
    func setMessageInLabel() {
        if let msg = message {
            dataLabel.text = msg
            dataLabel.sizeToFit()
        }
    }
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
