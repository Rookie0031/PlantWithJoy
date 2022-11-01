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

    var id: String = ""

    let reminderPlantName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font.withSize(14)
        return label
    }()

    let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    lazy var reminderCheckButton = DefaultButton().then {
        let image = UIImage(systemName: "drop", withConfiguration: symbolConfiguration)
        $0.setImage(image, for: .normal)
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        addsubviews()
        reminderCheckButton.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didPressDoneButton(_ sender: DefaultButton) {
        sender.isTapped.toggle()
        if sender.isTapped {
            sender.setImage(UIImage(systemName: "drop.fill", withConfiguration: symbolConfiguration), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "drop", withConfiguration: symbolConfiguration), for: .normal)
        }
    }

    func addsubviews() {
        contentView.addSubview(reminderPlantName)
        contentView.addSubview(reminderCheckButton)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0))
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
