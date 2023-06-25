//
//  Localisation.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

extension Bundle {

    /// This is used to get the Current Bundle for the Localization
    static var currentBundle: Bundle {
        let bundleMain: Bundle = .main
        if let path = bundleMain.path(forResource: "en", ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle
        }
        return bundleMain
    }
}

// MARK: Localizable
public protocol Localizable {
    var localized: String { get }
}

/// To get the Localized String from Localization file
extension String: Localizable {
    public var localized: String {
        return NSLocalizedString(self, bundle: Bundle.currentBundle, comment: "")
    }
}
