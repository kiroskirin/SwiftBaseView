//
//  SBVBaseViewController.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 28/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

typealias BaseViewControllerProtocol = SBVBaseViewControllerProtocol
protocol SBVBaseViewControllerProtocol: class {
    static var instance: UIViewController { get }
}

// Xib

typealias BaseViewController = FLOBaseViewController
protocol FLOBaseViewController: BaseViewControllerProtocol {}

extension FLOBaseViewController where Self: UIViewController {
    static var instance: UIViewController {
        return Self(nibName: "\(Self.self)", bundle: nil)
    }
}

// Storyboard

typealias BaseViewControllerFromStoryboard = FLOBaseViewControllerFromStoryboard
protocol FLOBaseViewControllerFromStoryboard: BaseViewControllerProtocol {
    static var identifier: String { get }
    static var storyboardName: String { get }
}

extension FLOBaseViewControllerFromStoryboard where Self: UIViewController {
    static var instance: UIViewController {
        return UIStoryboard(name: Self.storyboardName, bundle: nil).instantiateViewController(withIdentifier: Self.identifier) as! Self
    }
}
