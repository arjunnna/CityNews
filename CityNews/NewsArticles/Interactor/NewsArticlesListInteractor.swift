//
//  NewsArticlesListInteractor.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation


/// This is used to Get the News Articles
protocol NewsArticlesListInteractorInput {
  func getNewsArticles(_ pageId: String, _ searchText: String?)
}

/// This is used to Present the NewsArticles List
protocol NewsArticlesListInteractorOutput {
    func presentNewsArticlesList(_ newsArticles: [NewsArticleModel], errorMsg: String?)
}

/// Confirming the Outout to Interactor
extension NewsArticlesListInteractor: NewsArticlesListViewControllerOutput {
    
}

/// This is used to Interact with worker and get the NewsList
class NewsArticlesListInteractor: NewsArticlesListInteractorInput {
    
    var output: NewsArticlesListInteractorOutput?
    var worker: NewsArticlesListWorker?

    /// Intializing the NewsArticlesListInteractor with NewsArticlesListInteractorOutput and NewsArticlesListWorker
    init(output: NewsArticlesListInteractorOutput? = nil, worker: NewsArticlesListWorker? = nil) {
        self.output = output
        self.worker = worker
    }
    
    // MARK: Business logic
    /// This Mehtod is used to get the News Articles for the Page ID
    func getNewsArticles(_ pageId: String, _ searchText: String? = nil) {
        DispatchQueue.global(qos: .default).async {[weak self] in
            self?.worker?.getNewsArticles(pageId, searchText ?? "iOS") { (newsList, error) in
                self?.output?.presentNewsArticlesList(newsList, errorMsg: error)
            }
        }
    }
}
