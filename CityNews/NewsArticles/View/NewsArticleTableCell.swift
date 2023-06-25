//
//  NewsArticleTableCell.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import UIKit
import SDWebImage

/// This TableCell is used to Display the News Articles
class NewsArticleTableCell: UITableViewCell {

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleSource: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!

    @IBOutlet weak var stackView: UIStackView!
    

    static let reuseIdentifier = "NewsArticleTableCell"

    var viewModel = NewsArticleListViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }

    func configureNewsArticleImage(_ urlString: String) {
        self.articleImageView.isHidden = true
        self.articleImageView.image = nil
        if let url = URL(string: urlString) {
            self.articleImageView.isHidden = false
            articleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
    }

    /// This Method is used to setup the View
    func setUpView() {
        self.articleTitle.font = UIFont.theSansArabicBold(size: FontSize.large.value)
        self.articleAuthor.font = UIFont.theSansArabicRegular(size: FontSize.medium.value)
        self.articleSource.font = UIFont.theSansArabicRegular(size: FontSize.medium.value)
        self.articleTitle.accessibilityIdentifier = NewsArticlesListIdentifiers.cellTitle.rawValue
        self.dropDownShadow(opacity: 0.1, offset: CGSize(width: -1, height: 1), cornerRadius: 16)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
