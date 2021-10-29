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
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "YoutubeTabBarController") as? YoutubeTabBarController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func goToAnotherAccount(_ sender: Any) {
        // 현규님의 코드를 활용
        // https://github.com/29th-WE-SOPT-iOS-Part/KimTaeHyeon/pull/13#discussion_r731730132
        // popToViewController 메서드 사용
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        // 📌 viewControllers: navigation stack 의 view controller 들을 가지는 프로퍼티.
        let viewControllerStack = presentingVC.viewControllers
        self.dismiss(animated: true) {
            for viewController in viewControllerStack {
                // 📌 특정 뷰컨트롤러(LoginViewController)로 다운캐스팅되면 블럭 실행. 즉, navigation stack 에 특정 뷰컨트롤러가 존재한다고 판단 가능.
                if let rootVC = viewController as? LoginViewController {
                    presentingVC.popToViewController(rootVC, animated: true)
                }
            }
        }
    }
    
}
