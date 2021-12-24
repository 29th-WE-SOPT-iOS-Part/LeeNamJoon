//
//  UserSignupService.swift
//  
//
//  Created by 이남준 on 2021/11/14.
//

import Foundation
import Alamofire

struct UserSignupService {
    static let shared = UserSignupService()
    
    func signup(name: String, email: String, password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.signupURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
                
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignupStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignupStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        guard let decodedData = try? JSONDecoder().decode(LoginResponseData.self, from: data) else {return .pathErr}
        
        switch statusCode {
        case 200: return .success(decodedData)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr(decodedData.message)
        default: return .networkFail
        }
    }
}
