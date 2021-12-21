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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(appData: HomeVideo) {
        homeVideoThumbnail.image = appData.makeVideoThumbnailImage()
        homeVideoProfileImage.image = appData.makeVideoOwnerImage()
        homeVideoName.text = appData.videoName
        homeVideoSpec.text = appData.videoDescription
    }
}
