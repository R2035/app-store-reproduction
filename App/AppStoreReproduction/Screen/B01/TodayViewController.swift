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

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.register(cellType: TodayFeatureLargeImageCell.self)

        viewModel.sections.sink { [weak self] sections in
            self?.update(sections: sections)
        }.store(in: &cancellables)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = dataSource.sectionIdentifier(for: indexPath.section) else {
            fatalError("sectionが不正")
        }

        let items = dataSource.snapshot().itemIdentifiers(inSection: section)
        let item = items[indexPath.row]

        switch item {
        case .feature:
            return 480
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = dataSource.sectionIdentifier(for: indexPath.section) else {
            fatalError("sectionが不正")
        }

        let items = dataSource.snapshot().itemIdentifiers(inSection: section)
        let item = items[indexPath.row]

        switch item {
        case .feature:
            return 480
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
}
