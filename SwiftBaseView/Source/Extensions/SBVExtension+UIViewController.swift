//
//  SBVExtension+UIViewController.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 29/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.frame = view.frame
        child.didMove(toParent: self)
        view.addSubview(child.view)
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        UIView.transition(with: self.view, duration: 0.25, options: [.curveEaseInOut], animations: {
            self.view.alpha = 0.0
        }) { (fn) in
            self.view.removeFromSuperview()
        }
    }
}
