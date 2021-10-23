//
//  AppInstallView.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import UIKit

final class AppInstallView: UIView {
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        return imageView
    }()

    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 2
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .systemGray
        return label
    }()

    private lazy var installButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .systemGray
        let button = UIButton(configuration: buttonConfiguration, primaryAction: UIAction(handler: { [weak self] _ in
        }))
        return button
    }()

    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .systemGray
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground

        addSubview(thumbnailImageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        addSubview(installButton)
        addSubview(warningLabel)

        thumbnailImageView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(16)
        }

        labelStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8)
        }

        installButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(labelStackView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(16)
        }

        warningLabel.snp.makeConstraints { make in
            make.centerX.equalTo(installButton)
            make.top.equalTo(installButton.snp.bottom).offset(4)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
