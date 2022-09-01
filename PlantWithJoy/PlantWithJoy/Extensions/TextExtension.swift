//
//  TextExtension.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/09/01.
//

import Foundation
import UIKit

extension UITextView {
    func setLineAndLetterSpacing(_ text: String){
        let style = NSMutableParagraphStyle()
        let fontSize = UIFont.boldSystemFont(ofSize: 16)
        // 행간 세팅
        style.lineSpacing = 5
        let attributedString = NSMutableAttributedString(string: text)
        // 자간 세팅
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(0), range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: text))
        self.attributedText = attributedString
    }
}
