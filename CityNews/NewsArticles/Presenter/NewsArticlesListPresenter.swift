//
//  NewsArticlesListPresenter.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation
import UIKit

/// NewsList Presenter Input Protocal
protocol NewsArticlesListPresenterInput {
    func presentNewsArticlesList(_ newsArticlesList: [NewsArticleModel], errorMsg: String?)
}

/// NewsList Presenter Out Protocal
protocol NewsArticlesListPresenterOutput: AnyObject {
    func showNewsArticlesList()
}

extension NewsArticlesListPresenter: NewsArticlesListInteractorOutput {

}

/// This is used to Preset the NewsArticlesList to NewsArticlesListViewController
class NewsArticlesListPresenter: NewsArticlesListPresenterInput {
    
    weak var output: NewsArticlesListViewController?

    /// Intializing the NewsArticlesListPresenter with NewsArticlesListViewController as output
    init(output: NewsArticlesListViewController? = nil) {
        self.output = output
    }
    
    // MARK: Presentation logic
    
    func presentNewsArticlesList(_ newsArticleModel: [NewsArticleModel], errorMsg: String?) {
        DispatchQueue.main.async {[weak self] in
            self?.output?.refreshControl.endRefreshing()
            self?.output?.showActivityIndicator(false)
            if errorMsg != nil {
                self?.output?.showNoNewsArticlesView()
                self?.showErrorAlert(errorMsg)
            } else {
                self?.output?.viewModel.updatedNewsArticleList(newsArticleModel)
                self?.output?.showNewsArticlesList()
            }
        }
    }
    
    ///This Method is used Show the error message and try again option when Request failes
    func showErrorAlert(_ message: String?) {
        let alert = UIAlertController(title: "error.title".localized, message: message ?? "", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "try.again".localized, style: .default) { _ in
            self.output?.getNewsArticles()
        }
        let cancel = UIAlertAction(title: "ok".localized, style: .default) { _ in
        }
        okBtn.accessibilityIdentifier = "okButtonIdentifier"
        alert.addAction(okBtn)
        alert.addAction(cancel)
        self.output?.navigationController?.present(alert, animated: true)
    }
}
