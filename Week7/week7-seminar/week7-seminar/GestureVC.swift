//
//  GestureVC.swift
//  week7-seminar
//
//  Created by 이남준 on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 제스쳐 인식기 초기화 및 생성
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(self, action: #selector(tapView(gestureRecognizer:)))
        
        // 뷰에 제스쳐 인식기 연결
        testView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("뷰 안에서 tap")
    }
}
