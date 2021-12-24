//
//  NetworkResult.swift
//  
//
//  Created by 이남준 on 2021/11/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr(T)
    case networkFail
}
