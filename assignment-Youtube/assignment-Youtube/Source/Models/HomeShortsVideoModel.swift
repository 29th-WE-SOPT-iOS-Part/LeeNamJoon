//
//  HomeShortsVideoModel.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/29.
//

import UIKit

struct HomeShortsVideo {
    let videoOwnerImageName: String
    let videoOwnerName: String
    
    func makeVideoOwnerImage() -> UIImage? {
        return UIImage(named: videoOwnerImageName)
    }
}

