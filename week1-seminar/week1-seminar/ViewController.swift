//
//  ViewController.swift
//  week1-seminar
//
//  Created by 이남준 on 2021/10/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        testLabel.text = "WE SOPT 1차 세미나"
        testLabel.sizeToFit() // 라벨 크기를 글자에 맞게 변경해주는 메소드
    }
    @IBAction func touchUpToGoSecondView(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        //nextVC.modalPresentationStyle = .pageSheet
        //nextVC.modalTransitionStyle = .crossDissolve
        //self.present(nextVC, animated: true, completion: nil)
    }
}
