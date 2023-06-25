//
//  NewsSourceModel.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This Class used for NewsSourceModel
struct NewsSourceModel: Decodable,  Hashable {
    /// This is used for name of the NewsSourceModel
    var name: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}
