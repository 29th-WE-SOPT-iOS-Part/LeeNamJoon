//
//  HomeTableViewCell.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/29.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"

    @IBOutlet weak var homeVideoThumbnail: UIImageView!
    @IBOutlet weak var homeVideoProfileImage: UIImageView!
    @IBOutlet weak var homeVideoName: UILabel!
    @IBOutlet weak var homeVideoSpec: UILabel!
    @IBOutlet weak var homeVideoActButton: UIButton!
    
    var showVideoDetail: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        homeVideoThumbnail.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        setGesture()
    }
    
    func setGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        homeVideoThumbnail.addGestureRecognizer(gesture)
        homeVideoThumbnail.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        print("taptap")
        showVideoDetail?()
    }
    
    func setData(appData: HomeVideo) {
        homeVideoThumbnail.image = appData.makeVideoThumbnailImage()
        homeVideoProfileImage.image = appData.makeVideoOwnerImage()
        homeVideoName.text = appData.videoName
        homeVideoSpec.text = appData.videoDescription
    }
}
