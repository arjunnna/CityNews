//
//  NewsArticlesTarget.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

enum NewsBaseUrl: String {
    case baseUrl = "https://newsapi.org/"
    case apiKey = "ff5dd264260b4237824db412717b7735"
}

/// This is used to get the News Articles
enum NewsArticlesTarget {
    case getNewsArticles(pageId: String, searchText: String)
}

extension NewsArticlesTarget: TargetType {

    /// The target's base `URL`.
    var baseURL: String {
        return NewsBaseUrl.baseUrl.rawValue
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .getNewsArticles:
            return "v2/everything"
        }
    }

    /// The HTTP method used in the request.
    var method: RequestType {
        return .get
    }

    /// Provides stub data for use in testing.
    var sampleData: Data {
        switch self {
        case .getNewsArticles:
            if let path = Bundle.main.path(forResource: "NewsArticlesList", ofType: "json") {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                    return data
                }
            }
            return Data()
        }
    }

    /// The headers to be used in the request.
    var headers: [String : String] {
        return [
            "Content-type": "application/json",
            "Vary": "Accept"
        ]
    }

    /// The Query Parameters to be used in the request.
    var params: [String: String] {
        switch self {
        case .getNewsArticles(let pageId, let searchText):
            return ["page": pageId,
                    "qinTitle": searchText,
                    "apiKey": NewsBaseUrl.apiKey.rawValue,
                    "from": DateUtilities.getDateToFetchRecords(date: Date()),
                    "pageSize": "20",
                    "sortBy": "publishedAt"]
        }
    }
}
