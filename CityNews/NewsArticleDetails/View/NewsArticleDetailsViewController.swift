//
//  NewsArticleDetailsViewController.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import UIKit

/// This Controller is used to Dispaly details of the News Article
class NewsArticleDetailsViewController: UIViewController {

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleSource: UILabel!
    @IBOutlet weak var articlePublisheTime: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!

    var viewModel: NewsArticleDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "news.details.title".localized
        self.setUpView()
        self.updateUI()
    }

    func setUpView() {
        let backBtn = UIBarButtonItem(image: UIImage(named: "backIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnAction(_ :)))
        backBtn.accessibilityIdentifier = NewsArticleDetailsIdentifiers.backButton.rawValue
        self.navigationItem.leftBarButtonItem  = backBtn
        self.articleTitle.font = UIFont.theSansArabicBold(size: FontSize.large.value)
        self.articleAuthor.font = UIFont.theSansArabicRegular(size: FontSize.medium.value)
        self.articleSource.font = UIFont.theSansArabicRegular(size: FontSize.medium.value)
        self.articleDescription.font = UIFont.theSansArabicRegular(size: FontSize.large.value)
        self.articlePublisheTime.font = UIFont.theSansArabicRegular(size: FontSize.medium.value)
    }

    func updateUI() {
        self.articleImageView.isHidden = true
        if let url = URL(string: self.viewModel.getUrlToImage()) {
            self.articleImageView.isHidden = false
            articleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
        self.articleTitle.text = self.viewModel.getNewsTitle()
        self.articleAuthor.text = self.viewModel.getNewsAuthor()
        self.articleSource.text = self.viewModel.getNewsSourceName()
        self.articlePublisheTime.text = self.viewModel.getArticlePublishDate()
        self.articleDescription.text = self.viewModel.getArticleDescription()
    }

    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
