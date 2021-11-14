//
//  HomeCollectionViewCell.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/29.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    @IBOutlet weak var homeShortsIconImageView: UIImageView!
    @IBOutlet weak var homeShortsNameLabel: UILabel!
    
    func setData(iconImage: UIImage?, nameLabel: String) {
        homeShortsIconImageView.image = iconImage
        homeShortsNameLabel.text = nameLabel
    }
}
