//
//  AddPlantViewControllerUI.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/03.
//
import UIKit

let addPlantViewTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "My Plant"
    label.font = UIFont(name: "HiraMinProN-W6", size: 24)
    return label
}()

let tapGuideLabel: UILabel = {
    let label = UILabel()
    label.text = "Plant image"
    label.font?.withSize(20)
    return label
}()

let plantNameLabel: UILabel = {
    let label = UILabel()
    label.text = "NickName"
    label.font?.withSize(20)
    return label
}()

let plantSpeciesLabel: UILabel = {
    let label = UILabel()
    label.text = "Species"
    label.font?.withSize(20)
    return label
}()

let DateOfSeedingLabel: UILabel = {
    let label = UILabel()
    label.text = "Date of seeding"
    label.font?.withSize(20)
    return label
}()

let wateringReminder: UILabel = {
    let label = UILabel()
    label.text = "Watering reminder"
    label.font?.withSize(20)
    return label
}()
