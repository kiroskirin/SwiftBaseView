//
//  SBVBaseNavigationViewController.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 29/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

typealias BaseNavigationViewController = SBVBaseNavigationViewController
final class SBVBaseNavigationViewController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        interactivePopGestureRecognizer?.delegate = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }

    deinit {
        delegate = nil
        interactivePopGestureRecognizer?.delegate = nil
    }

    // MARK: Private properties

    fileprivate var duringPushAnimation = false

}

extension SBVBaseNavigationViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let rootNavigation = navigationController as? BaseNavigationViewController else { return }

        rootNavigation.duringPushAnimation = false
    }
}

extension SBVBaseNavigationViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else {
            return true
        }

        // Disable pop gesture in two situations:
        // 1. when the pop animation is in progress
        // 2. when user swipes quickly a couple of times and animations don't have time to be performed
        return viewControllers.count > 1 && duringPushAnimation == false
    }
}
