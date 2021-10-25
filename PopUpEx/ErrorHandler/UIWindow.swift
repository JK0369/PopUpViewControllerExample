//
//  UIWindow.swift
//  PopUpEx
//
//  Created by 김종권 on 2021/10/25.
//

import UIKit

extension UIWindow {
    public var visibleViewController: UIViewController? {
        return visibleViewControllerFrom(viewController: rootViewController)
    }

    static private var firstRootViewController: UIViewController? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .first(where: { $0.isKeyWindow })?.rootViewController
    }

    private func visibleViewControllerFrom(viewController: UIViewController? = firstRootViewController) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return self.visibleViewControllerFrom(viewController: navigationController.visibleViewController)
        } else if let tabBarController = viewController as? UITabBarController {
            return self.visibleViewControllerFrom(viewController: tabBarController.selectedViewController)
        } else {
            if let presentedViewController = viewController?.presentedViewController {
                return visibleViewControllerFrom(viewController: presentedViewController)
            } else {
                return viewController
            }
        }
    }
}
