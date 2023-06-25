//
//  NewsArticlesResponseModel.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This is used for the Response fo the News Articles
struct NewsArticlesResponseModel: Decodable {
    /// This is used for status of the Response
    var status: String?
    /// This is used for total result count
    var totalResults: Int?
    /// This is used for NewsArticleModel of the Response
    var articles: [NewsArticleModel]?
    /// This is used for error message of the Response
    var message: String?
}
