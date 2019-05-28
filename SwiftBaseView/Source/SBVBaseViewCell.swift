//
//  SBVBaseViewCell.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 28/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

typealias CellProtocol = SBVCellProtocol
protocol SBVCellProtocol {
    static var nib: UINib { get }
    static var identifier: String { get }
}

typealias BaseViewCell = SBVBaseViewCellProtocol
protocol SBVBaseViewCellProtocol: CellProtocol {}

// Table view cell

extension BaseViewCell where Self: UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: "\(Self.self)", bundle: nil)
    }

    static var identifier: String {
        return "\(Self.self)"
    }
}

// Table view header footer

extension BaseViewCell where Self: UITableViewHeaderFooterView {
    static var nib: UINib {
        return UINib(nibName: "\(Self.self)", bundle: nil)
    }

    static var identifier: String {
        return "\(Self.self)"
    }
}

// Collection view cell

extension BaseViewCell where Self: UICollectionViewCell {
    static var nib: UINib {
        return UINib(nibName: "\(Self.self)", bundle: nil)
    }

    static var identifier: String {
        return "\(Self.self)"
    }
}

// Collection reusable view

extension BaseViewCell where Self: UICollectionReusableView {
    static var nib: UINib {
        return UINib(nibName: "\(Self.self)", bundle: nil)
    }

    static var identifier: String {
        return "\(Self.self)"
    }
}
