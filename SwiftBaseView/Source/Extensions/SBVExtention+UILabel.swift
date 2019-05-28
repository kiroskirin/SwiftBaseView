//
//  SBVExtention+UILabel.swift
//  SwiftBaseView
//
//  Created by Kraisorn Soisakhu on 29/5/2562 BE.
//  Copyright © 2562 Kraisorn Soisakhu. All rights reserved.
//

import UIKit

extension UILabel {
    func getExistAttributedStyle() -> [NSAttributedString.Key: Any]? {
        guard let existAttr = self.attributedText?.attributes(at: 0, effectiveRange: nil) else {
            return nil
        }
        return existAttr
    }

    func setAttributedTextFromExistStyle(_ textValue: String?) {
        guard let txt = textValue else { return }
        guard let existAttr = getExistAttributedStyle() else {
            self.text = txt
            return
        }
        let attr = NSAttributedString(string: txt, attributes: existAttr)
        self.attributedText = attr
    }

    func setAttributedTextFromExistStyle(_ textValue: NSAttributedString?) {
        guard let txt = textValue else { return }
        guard let existAttr = getExistAttributedStyle() else {
            self.attributedText = txt
            return
        }
        let attr = NSMutableAttributedString(attributedString: txt)
        attr.setAttributes(existAttr, range: NSRange(location: 0, length: txt.length))
        self.attributedText = attr
    }
}
