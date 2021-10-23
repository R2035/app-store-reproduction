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
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemGray
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()

    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        stackView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 2
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray
        return label
    }()

    private lazy var installStatusButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .systemGray6
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20)
        buttonConfiguration.cornerStyle = .capsule

        let button = UIButton(configuration: buttonConfiguration, primaryAction: nil)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        return button
    }()

    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 9)
        label.textColor = .systemGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground

        addSubview(thumbnailImageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        addSubview(installStatusButton)
        addSubview(warningLabel)

        thumbnailImageView.snp.makeConstraints { make in
            make.size.equalTo(48)
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }

        labelStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8)
            make.height.lessThanOrEqualToSuperview()
        }

        installStatusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(labelStackView.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
        }

        warningLabel.snp.makeConstraints { make in
            make.centerX.equalTo(installStatusButton)
            make.top.equalTo(installStatusButton.snp.bottom).offset(4)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(imageURL: String, title: String, description: String, installStatus: String, warning: String) {
        // TODO: ImageViewに画像を表示する
        titleLabel.text = title
        descriptionLabel.text = description
        warningLabel.text = warning

        var container = AttributeContainer()
        container.font = .preferredFont(forTextStyle: .footnote)
        container.foregroundColor = .systemBlue

        var buttonConfiguration = installStatusButton.configuration
        buttonConfiguration?.attributedTitle = AttributedString(installStatus, attributes: container)

        installStatusButton.configuration = buttonConfiguration
    }
}
