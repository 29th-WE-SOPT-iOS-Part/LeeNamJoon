//
//  LoginResponseDataModel.swift
//  week4-seminar
//
//  Created by 이남준 on 2021/10/30.
//

import Foundation

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
