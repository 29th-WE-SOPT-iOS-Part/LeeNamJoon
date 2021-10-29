//
//  PartDataModel.swift
//  week3-seminar
//
//  Created by 이남준 on 2021/10/23.
//

import UIKit

struct PartData {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
