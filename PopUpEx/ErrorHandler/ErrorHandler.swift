//
//  ErrorHandler.swift
//  PopUpEx
//
//  Created by 김종권 on 2021/10/19.
//

import Foundation
import UIKit

struct ErrorHandler {

    static func showAlert(_ error: Error?,
                          leftActionCallback: (() -> Void)? = nil,
                          rightActionCallback: (() -> Void)? = nil,
                          completionDidTapRetryButton: (() -> Void)? = nil) {

        guard let error = error as? ErrorType else { return }

        let errorData: ErrorData
        let leftActionTitle: String?
        let rightActionTitle: String

        switch error {
        case .notConnectedToInternet(let data):
            errorData = data
            leftActionTitle = nil
            rightActionTitle = "재시도"
        case .unknown(let data):
            errorData = data
            leftActionTitle = nil
            rightActionTitle = "확인"
        }

        showAlert(errorData,
                  leftActionTitle: leftActionTitle,
                  rightActionTitle: rightActionTitle,
                  leftActionCallback: leftActionCallback,
                  rightActionCallback: rightActionCallback,
                  completionDidTapRetryButton: completionDidTapRetryButton)
    }

    static func showAlert(_ errorData: ErrorData,
                          leftActionTitle: String? = nil,
                          rightActionTitle: String,
                          leftActionCallback: (() -> Void)? = nil,
                          rightActionCallback: (() -> Void)? = nil,
                          completionDidTapRetryButton: (() -> Void)? = nil) {

        var rightActionCallback = rightActionCallback
        if completionDidTapRetryButton != nil, rightActionTitle == "재시도" {
            rightActionCallback = completionDidTapRetryButton
        }

        let rootViewController = UIApplication.shared.windows.first?.visibleViewController
        DispatchQueue.main.async {
            rootViewController?.showPopUp(title: errorData.title,
                                          message: errorData.message,
                                          leftActionTitle: leftActionTitle,
                                          rightActionTitle: rightActionTitle,
                                          leftActionCompletion: leftActionCallback,
                                          rightActionCompletion: rightActionCallback)
        }
    }
}
