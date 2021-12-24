//
//  UserLoginService.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/12/24.
//

import Foundation
import Alamofire

struct UserLoginService {
    static let shared = UserLoginService()
    
    func login(email: String, password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.loginURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
                
            case .success:
                print(dataResponse.result)
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
                print("err")
                completion(.networkFail)
            }
        }
    }
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        guard let decodedData = try? JSONDecoder().decode(LoginResponseData.self, from: data) else {return .pathErr}
        
        switch statusCode {
        case 200: return .success(decodedData)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr(decodedData.message)
        default: return .networkFail
        }
    }
}
