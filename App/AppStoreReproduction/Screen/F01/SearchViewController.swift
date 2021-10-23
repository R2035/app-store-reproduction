//
//  SearchViewController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import UIKit

/// F01 検索
final class SearchViewController: UITableViewController {
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = L10n.F01.placeholder
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.F01.title

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.backgroundColor = .systemBackground
    }
}
