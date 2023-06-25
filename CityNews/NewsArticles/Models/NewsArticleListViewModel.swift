//
//  NewsArticleListViewModel.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This Class is used to handle the business logic for NewsArticlesListViewController
class NewsArticleListViewModel {
    
    var newsArticleModel: [NewsArticleModel] = []

    func updatedNewsArticleList(_ newsArticleModel: [NewsArticleModel]) {
        self.newsArticleModel.append(contentsOf: newsArticleModel)
    }
 
    /// To Get number of Rows in NewsArticlesListViewController
    /// - Returns: returns Number of Row
    func numberOfRows() -> Int {
        return self.newsArticleModel.count
    }

    /// This is used to ge the Title of the News
    func getNewsTitle(_ index: Int) -> String {
        var newsTitle = ""
        if let name = self.newsArticleModel[index].title {
            newsTitle = name
        }
        return newsTitle
    }

    /// This is used to ge the Author Name of the News
    func getNewsSourceName(_ index: Int) -> String {
        var sourceName = "news.source".localized
        if let name = self.newsArticleModel[index].source?.name {
            sourceName = "\(sourceName) \(name)"
        }
        return sourceName
    }

    /// This is used to ge the Author of the News
    func getNewsAuthor(_ index: Int) -> String {
        var authorName = "news.author".localized
        if let author = self.newsArticleModel[index].author {
            authorName = "\(authorName) \(author)"
        }
        return authorName
    }

    /// This is used to ge the Author of the News
    func getUrlToImage(_ index: Int) -> String {
        var urlToImage = ""
        if let imageString = self.newsArticleModel[index].urlToImage {
            urlToImage = imageString
        }
        return urlToImage
    }
}
