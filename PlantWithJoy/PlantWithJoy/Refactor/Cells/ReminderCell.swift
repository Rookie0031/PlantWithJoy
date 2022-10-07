//
//  ReminderCell.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/07.
//
import SnapKit
import Then
import UIKit

class ReminderCell: UITableViewCell {
    static let identifier = "ReminderCell"

    let reminderPlantName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font.withSize(14)
        return label
    }()

    let reminderCheckButton = UIButton().then {
        $0.setImage(UIImage(systemName: "circle"), for: .normal)
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        addsubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addsubviews() {
        contentView.addSubview(reminderPlantName)
        contentView.addSubview(reminderCheckButton)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        reminderCheckButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        reminderPlantName.snp.makeConstraints {
            $0.leading.equalTo(reminderCheckButton).offset(30)
            $0.centerY.equalToSuperview()
        }
    }

    func setupCellData(_ item: Myplant) {
        reminderPlantName.text = item.nickName
    }
}
