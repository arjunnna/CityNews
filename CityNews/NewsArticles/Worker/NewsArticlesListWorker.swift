//
//  NewsArticlesListWorker.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation
import Network

/// This is used to get the News Articles List
class NewsArticlesListWorker {

    var apiManager: APIManagerType?

    /// Intializing the NewsArticlesListWorker with API Manager Type
    init(apiManager: APIManagerType? = nil) {
        self.apiManager = apiManager
    }
    
    /// This is used to get the News Articles
    func getNewsArticles(_ pageId: String,
                         _ searchText: String,
                         completion: @escaping(([NewsArticleModel], String?) -> Void)) {
        if Reachability.isConnectedToNetwork() {
            apiManager?.request(NewsArticlesTarget.getNewsArticles(pageId: pageId, searchText: searchText)) { (result: Envelope<NewsArticlesResponseModel>) in
                switch result {
                case .success(let response):
                    if let articles = response.articles {
                        completion(articles, nil)
                    } else if let isError = response.status, isError == APIManagerErrors.error.errorDescription {
                        if let message = response.message, message.count > 0 {
                            completion([], message)
                        } else {
                            completion([], APIManagerErrors.noArticles.errorDescription)
                        }
                    }
                case .failure(let error):
                    completion([], error.errorDescription)
                }
            }
        } else {
            completion([], APIManagerErrors.noInternetConnection.errorDescription)
        }
    }
}
