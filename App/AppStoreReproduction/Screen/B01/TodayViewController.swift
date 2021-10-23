//
//  TodayViewController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Combine
import Foundation
import UIKit

/// B01 Today
final class TodayViewController: UITableViewController {
    private let viewModel: TodayViewModel = AppDelegate.assembler.resolver.resolve()

    private var cancellables = Set<AnyCancellable>()

    private lazy var dataSource: UITableViewDiffableDataSource<TodaySection, TodayItem> = {
        let dataSource = UITableViewDiffableDataSource<TodaySection, TodayItem>(tableView: tableView) { tableView, indexPath, item -> UITableViewCell? in
            switch item {
            case let .feature(description, title, imageURL):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TodayFeatureLargeImageCell.self)
                cell.update(description: description, title: title, imageURL: imageURL)
                return cell
            }
        }

        return dataSource
    }()

    init() {
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delaysContentTouches = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.register(headerFooterViewType: TodayFeatureHeader.self)
        tableView.register(cellType: TodayFeatureLargeImageCell.self)

        viewModel.sections.sink { [weak self] sections in
            self?.update(sections: sections)
        }.store(in: &cancellables)

        viewModel.destination.sink { [weak self] destination in
            self?.transition(destination: destination)
        }.store(in: &cancellables)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch dataSource.sectionIdentifier(for: section) {
        case let .feature(date):
            let header = tableView.dequeueReusableHeaderFooterView(TodayFeatureHeader.self)
            header?.update(date: date) { [weak self] in
                self?.viewModel.accountButtonDidTouchUpInside()
            }
            return header
        case nil:
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch dataSource.sectionIdentifier(for: section) {
        case .feature:
            return UITableView.automaticDimension
        case nil:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        switch dataSource.sectionIdentifier(for: section) {
        case .feature:
            return 100
        case nil:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource.itemIdentifier(for: indexPath) {
        case .feature:
            return 480
        case nil:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource.itemIdentifier(for: indexPath) {
        case .feature:
            return 480
        case nil:
            return 0
        }
    }

    private func update(sections: [(TodaySection, [TodayItem])]) {
        var snapshot = NSDiffableDataSourceSnapshot<TodaySection, TodayItem>()
        sections.forEach { section, items in
            snapshot.appendSections([section])
            snapshot.appendItems(items)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func transition(destination: TodayDestination) {
        switch destination {
        case .account:
            let AccountNavigationController = UINavigationController(rootViewController: AccountViewController())
            present(AccountNavigationController, animated: true)
        }
    }
}
