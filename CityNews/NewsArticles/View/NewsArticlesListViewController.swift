//
//  NewsArticlesListViewController.swift
//  CityNews
//
//  Created by Mallikarjuna on 25/06/2023.
//

import UIKit

///This Protocal is used To the News Articles List
protocol NewsArticlesListViewControllerOutput {
    func getNewsArticles(_ pageId: String, _ searchText: String?)
}

///This Protocal is Show the News Articles List
protocol NewsArticlesListViewControllerInput {
    func showNewsArticlesList()
}

/// This Controller is used to Dispaly the List of News Articles
class NewsArticlesListViewController: UIViewController, NewsArticlesListViewControllerInput, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchHolderView: UIView!
    @IBOutlet weak var noNewsArticlesView: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var noNewsArticlesLbl: UILabel!

    let refreshControl = UIRefreshControl()

    /// Type Alias for TableDataSource
    private typealias TableDataSource = UITableViewDiffableDataSource<Int, NewsArticleModel>
    /// TableDataSource Object
    private var dataSource: TableDataSource?

    var output: NewsArticlesListInteractor?
    var router: NewsArticlesListRouter?
    var viewModel = NewsArticleListViewModel()
    var page: Int = 1
    var isPageRefreshing:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.configureDataSource()
        NewsArticlesListConfiguarator().configure(viewController: self)
        self.getNewsArticles()
    }

    /// Setup View
    func setUpView() {
        self.title = "news.title".localized
        self.searchHolderView.layer.borderColor = UIColor.lightGray.cgColor
        self.searchHolderView.layer.borderWidth = 1
        self.searchField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
        self.tableView.accessibilityIdentifier = NewsArticlesListIdentifiers.tableView.rawValue
        self.noNewsArticlesLbl.font = UIFont.theSansArabicBold(size: FontSize.large.value)
        self.searchField.placeholder = "search".localized
        self.noNewsArticlesLbl.text = "no.results.title".localized
        refreshControl.attributedTitle = NSAttributedString(string: "pull.to.refresh.title".localized)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        self.getNewsArticles()
    }

    // MARK: - Input/Outout Protocals
    /// This Method is used to Get the News Articles
    func getNewsArticles() {
        self.showActivityIndicator(true)
        output?.getNewsArticles("\(page)")
    }

    /// This Method is used to show the News Articles List
    func showNewsArticlesList() {
        self.showNoNewsArticlesView()
        self.isPageRefreshing = false
        self.reloadData()
    }

    /// This is used to Reload the Data in TableView
    func reloadData() {
        if let dataSource = self.dataSource {
            var snapshot =  dataSource.snapshot()
            snapshot.deleteAllItems()
            snapshot.appendSections([0])
            snapshot.appendItems(self.viewModel.newsArticleModel, toSection: 0)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    /// This Method is used to Show and Hode the Activity Indicator
    func showActivityIndicator(_ show: Bool) {
        self.activityIndicatorView.isHidden = !show
        if show {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func textFieldEditingDidChange(_ textField: UITextField) {
        if let text = textField.text {
            /// Reset the Page Count when searcing
            page = 1
            output?.getNewsArticles("\(page)", text)
        }
    }

    /// This Method is used to Show and Hide the No Results View
    func showNoNewsArticlesView(){
        if self.viewModel.numberOfRows() == 0 {
            self.noNewsArticlesView.isHidden = false
            self.tableView.isHidden = true
        } else {
            self.noNewsArticlesView.isHidden = true
            self.tableView.isHidden = false
        }
    }
}

extension NewsArticlesListViewController: UITableViewDelegate {
    /// This is used to Configure TableView DataSource
    private func configureDataSource() {
        dataSource = TableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, newsArticleModel) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsArticleTableCell.reuseIdentifier, for: indexPath) as? NewsArticleTableCell
            cell?.articleTitle.text = self.viewModel.getNewsTitle(indexPath.row)
            cell?.articleAuthor.text = self.viewModel.getNewsAuthor(indexPath.row)
            cell?.articleSource.text = self.viewModel.getNewsSourceName(indexPath.row)
            cell?.configureNewsArticleImage(self.viewModel.getUrlToImage(indexPath.row))
            cell?.selectionStyle = .none
            return cell
        })
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.router?.navigateToNewsArticleDetailVc(self.viewModel.newsArticleModel[indexPath.row])
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height)) {
            if !isPageRefreshing {
                page = page + 1
                self.isPageRefreshing = true
                self.getNewsArticles()
            }
        }
    }
}
