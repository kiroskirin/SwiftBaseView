//
//  SBVBaseView.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 29/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

typealias BaseViewProtocol = SBVBaseViewProtocol
protocol SBVBaseViewProtocol: class {
    var nibName: String { get }
    var contentView: UIView! { get set }
}

extension BaseViewProtocol where Self: UIView {
    func loadNib(_ name: String) {
        Bundle.main.loadNibNamed(name, owner: self, options: nil)
    }

    func bindingView() {
        loadNib(nibName)

        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(contentView)
    }
}

public class BaseUIView: UIView, BaseViewProtocol {
    @IBOutlet weak var contentView: UIView!

    public override init(frame: CGRect) {
        super.init(frame: frame)

        bindingView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        bindingView()
    }

    public var nibName: String {
        return "\(self) must override `nibName` property"
    }
}
