//
//  HomeDetailVC.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/12/24.
//

import UIKit

class HomeDetailVC: UIViewController {
    
    static let identifier = "HomeDetailVC"

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailVideoNameLabel: UILabel!
    @IBOutlet weak var detailVideoSpecLabel: UILabel!
    @IBOutlet weak var goToVideoListButton: UIButton!
    
    var detailInfo: HomeVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setUIConfigure() {
        goToVideoListButton.layer.zPosition = 1000
    }
    
    func setData() {
        guard let detailInfo = self.detailInfo else {return}
        self.detailImageView.image = detailInfo.makeVideoThumbnailImage()
        self.detailVideoNameLabel.text = detailInfo.videoName
        self.detailVideoSpecLabel.text = detailInfo.videoDescription
    }
    
    @IBAction func goToVideoList(_ sender: Any) {
//        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
//        let viewControllerStack = presentingVC.viewControllers
        self.dismiss(animated: true, completion: nil)
    }
}
