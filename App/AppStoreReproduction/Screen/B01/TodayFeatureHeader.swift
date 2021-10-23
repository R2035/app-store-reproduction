//
//  TodayFeatureHeader.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import Reusable
import SnapKit
import UIKit

final class TodayFeatureHeader: UITableViewHeaderFooterView, Reusable {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGray
        return label
    }()

    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = L10n.B01.headerTodayTitle
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()

    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        return imageView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubview(dateLabel)
        contentView.addSubview(todayLabel)
        contentView.addSubview(accountImageView)

        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.leading.equalTo(dateLabel)
            make.trailing.equalTo(dateLabel)
            make.bottom.equalToSuperview().offset(16)
        }

        accountImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.leading.equalTo(dateLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(todayLabel)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(date: String) {
        dateLabel.text = date
    }
}
