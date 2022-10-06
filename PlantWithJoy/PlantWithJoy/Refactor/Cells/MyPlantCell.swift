//
//  TestingCell.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/02.
//
import SnapKit
import UIKit

class MyPlantCell: UICollectionViewCell {
    static let identifier = "TestingCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()

    private let dateOfSeedingLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(speciesLabel)
        contentView.addSubview(dateOfSeedingLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(75)
            $0.width.equalTo(75)
        }

        imageView.layer.cornerRadius = 30

        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(15)
            $0.top.equalTo(imageView.snp.top).inset(3)
        }

        speciesLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }

        dateOfSeedingLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.top.equalTo(speciesLabel.snp.bottom).offset(5)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        print("prepare for reuse!")
    }

    func setupCellData(_ item: Myplant) {
        imageView.image = UIImage(data: item.imageData)
        nameLabel.text = item.nickName
        speciesLabel.text = item.species
        dateOfSeedingLabel.text = item.dateOfSeeding.dayText
        imageView.layoutIfNeeded()
    }
}
