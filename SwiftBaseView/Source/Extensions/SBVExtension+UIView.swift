//
//  SBVExtension+UIView.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 29/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView {
    func snapshot(tableView: UITableView) -> UIImage? {
        let scale = UIScreen.main.scale
        let width = tableView.contentSize.width
        let height = tableView.contentSize.height
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height - 70), false, scale)

        let previousFrame = frame
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: height)

        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            frame = previousFrame
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }

    func snapshotView() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { (context) in
            layer.render(in: context.cgContext)
        })
    }
}

// Creating an extension for getting user added constraints
extension UIView {
    var userAddedConstraints: [NSLayoutConstraint] {
        return constraints.filter { c in
            guard let cId = c.identifier else { return true }
            return !cId.contains("UIView-Encapsulated-Layout")
        }
    }
}

extension UIView {
    var shadowColor: CGColor {
        return UIColor.black.cgColor
    }

    var shadowOpacity: Float {
        return 0.2
    }

    var shadowOffset: CGSize  {
        return CGSize(width: 0.3, height: 0.3)
    }

    var shadowRadius: CGFloat {
        return 3.0
    }

    func applyShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = self.shadowColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
    }

    func applyLargeShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = self.shadowColor
        self.layer.shadowOpacity = 0.125
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowRadius = 10.0
    }
}

extension UIView {
    class func animateScaleDown(_ view: UIView) {
        view.transform = CGAffineTransform.identity
        UIView.transition(with: view, duration: 0.2, options: [.allowUserInteraction], animations: {
            view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }

    class func animateScaleReset(_ view: UIView) {
        UIView.transition(with: view, duration: 0.2, options: [.allowUserInteraction], animations: {
            view.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension Bundle {
    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }

    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
}
