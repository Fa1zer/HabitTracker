//
//  CustomColors.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

extension UIColor {
    static let prettyWhite = UIColor(red: 242, green: 242, blue: 247)
    static let prettyPurple = UIColor(red: 161, green: 22, blue: 204)
    static let prettyBlue = UIColor(red: 41, green: 109, blue: 255)
    static let prettyGreen = UIColor(red: 29, green: 179, blue: 34)
    static let prettyIndigo = UIColor(red: 98, green: 54, blue: 255)
    static let prettyOrange = UIColor(red: 255, green: 159, blue: 79)
}
