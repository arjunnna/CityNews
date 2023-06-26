//
//  NewsArticleModel.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This Class used for NewsArticleModel
struct NewsArticleModel: Decodable, Hashable {
    var uuid: UUID = UUID()
    /// This is used for title of the NewsArticle
    var title: String?
    /// This is used for Author of the NewsArticle
    var author: String?
    /// This is used for the source of the NewsArticle
    var source: NewsSourceModel?
    /// This is used for the description of the NewsArticle
    var description:String?
    /// This is used for the Url of the NewsArticle
    var url:String?
    /// This is used for the Image of the NewsArticle
    var urlToImage:String?
    /// This is used for the Published time of the NewsArticle
    var publishedAt:String?

    enum CodingKeys: String, CodingKey {
        case title
        case author
        case source
        case description
        case url
        case urlToImage
        case publishedAt
    }
}
