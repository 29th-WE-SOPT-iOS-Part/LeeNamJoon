//
//  HomeVideoModel.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/29.
//

import UIKit

struct HomeVideo {
    let videoThumbnailName: String
    let videoOwnerImageName: String
    let videoName: String
    let videoDescription: String
    
    func makeVideoThumbnailImage() -> UIImage? {
        return UIImage(named: videoThumbnailName)
    }
    
    func makeVideoOwnerImage() -> UIImage? {
        return UIImage(named: videoOwnerImageName)
    }
}
