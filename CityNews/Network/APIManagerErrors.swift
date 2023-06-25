//
//  ApiManagerErrors.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This is used for the errors messages
enum APIManagerErrors: LocalizedError {
    case invalidURL
    case dataNil
    case decodingError
    case unknownError
    case noInternetConnection
    case noArticles
    case error

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "invalid.url.error".localized
        case .dataNil:
            return "empty.data.error".localized
        case .decodingError:
            return "invalid.data.format".localized
        case .noInternetConnection:
            return "no.internet.error".localized
        case .unknownError:
            return "error.occured".localized
        case .noArticles:
            return "no.articles.error".localized
        case .error:
            return "news.error".localized
        }
    }
}
