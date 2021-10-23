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
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()

    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = L10n.B01.headerTodayTitle
        label.font = .preferredFont(forTextStyle: .title1)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()

    private lazy var accountImageView: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        buttonConfiguration.image = UIImage(systemName: "person.circle", withConfiguration: imageConfiguration)
        let imageView = UIButton(configuration: buttonConfiguration, primaryAction: nil)
        return imageView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear

        contentView.addSubview(dateLabel)
        contentView.addSubview(todayLabel)
        contentView.addSubview(accountImageView)

        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.leading.equalTo(dateLabel)
            make.trailing.equalTo(dateLabel)
            make.bottom.equalToSuperview().offset(-4)
        }

        accountImageView.snp.makeConstraints { make in
            make.size.equalTo(32)
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
