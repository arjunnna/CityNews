//
//  UIView+Extension.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import UIKit

/// This is used for the View Extension
extension UIView {
    /// This is to set the corner radius in story board
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }

    func dropDownShadow(opacity: Float = 0.08,
                        offset:CGSize =  CGSize(width: 0, height: 0),
                        radius: CGFloat = 8, cornerRadius: CGFloat = 8) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
    }
}
