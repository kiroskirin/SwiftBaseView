//
//  SBVExtension+UINavigationController.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 29/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

extension UINavigationController {
    func removeNavBarBottomLine() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        setNeedsStatusBarAppearanceUpdate()
    }

    func setWhiteNavBarWithBottomLine() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .white
        navigationBar.isTranslucent = true
        setNeedsStatusBarAppearanceUpdate()
    }

    func setWhiteNavBar() {
        UIView.animate(withDuration: 0.3) {
            self.navigationBar.tintColor = .black
            self.navigationBar.backgroundColor = .white
            UIApplication.shared.statusBarView?.backgroundColor = .white
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    func setClearNavBar() {
        UIView.animate(withDuration: 0.3) {
            self.navigationBar.tintColor = .white
            self.navigationBar.backgroundColor = .clear
            UIApplication.shared.statusBarView?.backgroundColor = .clear
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}
