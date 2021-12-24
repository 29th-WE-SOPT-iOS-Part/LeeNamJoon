//
//  APIConstants.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/11/14.
//

import Foundation

struct APIConstants {
    //MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: Login URL
    static let loginURL = baseURL + "/user/login"
    
    //MARK: Signup URL
    static let signupURL = baseURL + "/user/signup"
}
