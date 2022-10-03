//
//  AddPlantViewControllerUI.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/03.
//
import UIKit
import Foundation

var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemGray6

    imageView.layer.cornerRadius = 20
    return imageView
}()

let addPlantViewTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "My Plant"
    label.font = UIFont(name: "HiraMinProN-W6", size: 24)
    return label
}()

let plantNameLabel: UILabel = {
    let label = UILabel()
    label.text = "NickName"
    label.font?.withSize(20)
    return label
}()

let nameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Nickname of plant"
    return textField
}()
