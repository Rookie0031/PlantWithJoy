//
//  TitleLabel.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/01.
//
import UIKit
import Foundation

let gardenTitleLabel: UILabel = {
    var label = UILabel()
    label.text = "GARDEN"
    label.font = UIFont(name: "HiraMinProN-W6", size: 24)
    return label
}()

let collectionViewTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "The Growing Plants"
    label.font = .systemFont(ofSize: 20, weight: .medium)
    return label
}()

let collectionViewSubTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "manage your garden"
    label.textColor = .systemGray3
    label.font.withSize(14)
    return label
}()

let addButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
    return button
}()

let tableViewTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Gardening reminder"
    label.font = .systemFont(ofSize: 20, weight: .medium)
    return label
}()

let tableViewSubTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Tap droplet, check your watering"
    label.textColor = .systemGray3
    label.font.withSize(14)
    return label
}()

let discoveryTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Discovery"
    label.font = .systemFont(ofSize: 20, weight: .medium)
    return label
}()

let discoverySubTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "articles for your plants"
    label.textColor = .systemGray3
    label.font.withSize(14)
    return label
}()
