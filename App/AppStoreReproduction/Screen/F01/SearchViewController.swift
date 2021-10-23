//
//  SearchViewController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Combine
import Foundation
import UIKit

/// F01 検索
final class SearchViewController: UITableViewController {
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = L10n.F01.placeholder
        return searchController
    }()

    private let viewModel: SearchViewModel = AppDelegate.assembler.resolver.resolve()

    private var cancellables = Set<AnyCancellable>()

    private lazy var dataSource: UITableViewDiffableDataSource<SearchSection, SearchItem> = {
        let dataSource = UITableViewDiffableDataSource<SearchSection, SearchItem>(tableView: tableView) { tableView, indexPath, item -> UITableViewCell? in
            switch item {
            case let .title(title):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SearchTitleCell.self)
                cell.update(title: title)
                return cell
            case let .find(title, isSeparatorHidden):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SearchFindCell.self)
                cell.update(title: title, isSeparatorHidden: isSeparatorHidden)
                return cell
            case let .recommendation(imageURL, title, description, installStatus, warning, isSeparatorHidden):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SearchAppInstallCell.self)
                cell.update(imageURL: imageURL, title: title, description: description, installStatus: installStatus, warning: warning, isSeparatorHidden: isSeparatorHidden)
                return cell
            }
        }
        return dataSource
    }()

    init() {
        super.init(style: .plain)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.F01.title

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.delaysContentTouches = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = dataSource
        tableView.register(cellType: SearchAppInstallCell.self)
        tableView.register(cellType: SearchFindCell.self)
        tableView.register(cellType: SearchTitleCell.self)

        viewModel.sections.sink { [weak self] sections in
            self?.update(sections: sections)
        }.store(in: &cancellables)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource.itemIdentifier(for: indexPath) {
        case .title:
            return UITableView.automaticDimension
        case .find:
            return UITableView.automaticDimension
        case .recommendation:
            return UITableView.automaticDimension
        case nil:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource.itemIdentifier(for: indexPath) {
        case .title:
            return 60
        case .find:
            return 40
        case .recommendation:
            return 100
        case nil:
            return 0
        }
    }

    private func update(sections: [(SearchSection, [SearchItem])]) {
        var snapshot = NSDiffableDataSourceSnapshot<SearchSection, SearchItem>()
        sections.forEach { section, items in
            snapshot.appendSections([section])
            snapshot.appendItems(items)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
