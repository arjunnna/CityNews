//
//  NewsArticlesListRouter.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation
import UIKit
 
protocol NewsArticlesListRouterInput {
    func navigateToNewsArticleDetailVc(_ newsArticleModel: NewsArticleModel)
}

/// This is Used for navigate to NewsList Details ViewController
class NewsArticlesListRouter {

    weak var viewController: NewsArticlesListViewController?

    /// Intialize the NewsArticlesListRouter with to navigate
    init(viewController: NewsArticlesListViewController? = nil) {
        self.viewController = viewController
    }

    // MARK: Navigation
    func navigateToNewsArticleDetailVc(_ newsArticleModel: NewsArticleModel) {
        /// Navigate to the NewsArticle Details Vc
        if let newsDetailsVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsArticleDetailsViewController") as? NewsArticleDetailsViewController {
            newsDetailsVc.viewModel = NewsArticleDetailViewModel(newsArticleModel)
            self.viewController?.navigationController?.pushViewController(newsDetailsVc, animated: true)
        }
    }
}
