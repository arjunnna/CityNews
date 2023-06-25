//
//  NewsArticlesListConfiguarator.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This is Used for Configuaring the NewsArticlesListViewController
class NewsArticlesListConfiguarator {

    /// This Method is used to Configure the Presenter and Interactor and Router
    func configure(viewController: NewsArticlesListViewController) {

        let presenter = NewsArticlesListPresenter(output: viewController)

        let interactor = NewsArticlesListInteractor(output: presenter, worker: NewsArticlesListWorker(apiManager: APIManager()))

        let router = NewsArticlesListRouter(viewController: viewController)

        viewController.output = interactor
        viewController.router = router
    }
}
