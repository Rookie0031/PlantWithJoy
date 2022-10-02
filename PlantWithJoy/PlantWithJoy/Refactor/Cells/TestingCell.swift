//
//  TestingCell.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/02.
//

import UIKit

class TestingCell: UICollectionViewCell {
    static let identifier = "TestingCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "dsad"
        label.font = UIFont(name: "HiraMinProN-W6", size: 10)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
//        contentView.addSubview(label)

        let images = [
            UIImage(named: "LogInPicture"),
            UIImage(named: "TestPlant"),
            UIImage(named: "TestPlant"),
            UIImage(named: "TestPlant"),
            UIImage(named: "TestPlant")
        ].compactMap({ $0 })


        imageView.image = images.randomElement()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        print("prepare for reuse!")
    }
}
