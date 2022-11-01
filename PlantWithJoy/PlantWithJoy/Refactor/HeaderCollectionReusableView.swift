//
//  HeaderCollectionReusableView.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/02.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    public func configure() {
        backgroundColor = .systemBlue
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
