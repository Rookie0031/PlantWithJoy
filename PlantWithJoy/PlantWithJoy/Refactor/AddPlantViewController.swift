//
//  AddPlantViewController.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/03.
//
import SnapKit
import UIKit
import Foundation

class AddPlantViewController: UIViewController, UITextFieldDelegate {

    let plantSpeciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Species"
        label.font?.withSize(20)
        return label
    }()

    let plantSpeciesTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Species of plant"
        return textField
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

    override func viewDidLoad() {
        super.viewDidLoad()
        addsubViews()
        configureUI()
        setDelegate()
    }

    private func setDelegate() {
        nameTextField.delegate = self
        plantSpeciesTextField.delegate = self
    }

    private func addsubViews() {
        view.addSubview(imageView)
        view.addSubview(addPlantViewTitleLabel)
        view.addSubview(plantNameLabel)
        view.addSubview(nameTextField)

        view.addSubview(plantSpeciesLabel)
        view.addSubview(plantSpeciesTextField)

        view.addSubview(DateOfSeedingLabel)
    }
    private func configureUI() {
        addPlantViewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }

        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(addPlantViewTitleLabel.snp.bottom).inset(-30)
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }

        plantNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalTo(imageView.snp.bottom).inset(-100)
        }

        nameTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(imageView.snp.bottom).inset(-100)
        }

        plantSpeciesLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalTo(plantNameLabel.snp.bottom).inset(-20)
        }

        plantSpeciesTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(nameTextField.snp.bottom).inset(-20)
        }

        DateOfSeedingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalTo(plantSpeciesLabel.snp.bottom).inset(-20)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

import SwiftUI
struct VCPreView:PreviewProvider {
    static var previews: some View {
        AddPlantViewController().toPreview()
    }
}
