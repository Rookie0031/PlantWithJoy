//
//  TitleLabel.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/01.
//
import UIKit
import Foundation

let collectionViewTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "The Growing Plants"
    label.font = .systemFont(ofSize: 20, weight: .medium)
    return label
}()

let collectionViewSubTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Manage your garden"
    label.textColor = .systemGray3
    label.font.withSize(14)
    return label
}()

let gardenTitleLabel: UILabel = {
    var label = UILabel()
    label.text = "GARDEN"
    label.font = UIFont(name: "HiraMinProN-W6", size: 24)
    return label
}()
