//
//  NewsArticleDetailViewModel.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import Foundation

/// This Class is used to Business Logic for NewsArticleDetail VC
class NewsArticleDetailViewModel {

    init(_ newsArticleModel: NewsArticleModel) {
        self.newsArticleModel = newsArticleModel
    }

    var newsArticleModel: NewsArticleModel?

    /// This is used to ge the Title of the News Article
    func getNewsTitle() -> String {
        var newsTitle = ""
        if let name = self.newsArticleModel?.title {
            newsTitle = name
        }
        return newsTitle
    }

    /// This is used to ge the Author Name of the News Article
    func getNewsSourceName() -> String {
        var sourceName = "news.source".localized
        if let name = self.newsArticleModel?.source?.name {
            sourceName = "\(sourceName) \(name)"
        }
        return sourceName
    }

    /// This is used to ge the Author of the News Article
    func getNewsAuthor() -> String {
        var authorName = "news.author".localized
        if let author = self.newsArticleModel?.author {
            authorName = "\(authorName) \(author)"
        }
        return authorName
    }

    /// This is used to ge the Image of the News Article
    func getUrlToImage() -> String {
        var urlToImage = ""
        if let imageString = self.newsArticleModel?.urlToImage {
            urlToImage = imageString
        }
        return urlToImage
    }

    /// This is used to ge the PublishDate of the News Article
    func getArticlePublishDate() -> String {
        var publishedDate = "news.publishedTime".localized
        if let publishedAt = self.newsArticleModel?.publishedAt {
            publishedDate = "\(publishedDate) \(DateUtilities.formatDate(publishedAt))"
        }
        return publishedDate
    }

    /// This is used to ge the Description of the News Article
    func getArticleDescription() -> String {
        var articleDescription = "news.description".localized
        if let description = self.newsArticleModel?.description {
            articleDescription = "\(articleDescription) \(description)"
        }
        return articleDescription
    }
}
