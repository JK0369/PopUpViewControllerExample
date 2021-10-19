//
//  API.swift
//  PopUpEx
//
//  Created by 김종권 on 2021/10/19.
//

import Foundation

enum ErrorType: Error {
    case notConnectedToInternet(ErrorData)
    case unknown(ErrorData)
}

struct ErrorData {
    let title: String?
    let message: String?
}

struct API {
    static func someAPI(completion: @escaping (Result<Void, ErrorType>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            completion(.failure(ErrorType.notConnectedToInternet(ErrorData(title: "네트워크 연결 에러입니다.\n네트워크 설정을 확인해주세요", message: ""))))
        }
    }
}
