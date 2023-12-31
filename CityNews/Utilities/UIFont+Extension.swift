//
//  UIFont+Extension.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import UIKit

/// This is used for Get Font based on Size
extension UIFont {
    
    /// Returns the Bold Font Based on Size
    static func theSansArabicBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "TheSansArabic-Bold", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    /// Returns the Bold Font Based on Size
    static func theSansArabicRegular(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "TheSansArabic-Plain", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}

/// This is used for Font Size Using this We can Avoid Using Random Font Sizes
public enum FontSize {

    case large
    case medium

    var value: CGFloat {
        switch self {
        case .large:
            return 16
        case .medium:
            return 14
        }
    }
}
