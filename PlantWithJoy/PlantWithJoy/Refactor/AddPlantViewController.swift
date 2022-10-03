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

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()

    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        let dayList = WeekDay.allCases

        for element in dayList {
            let button = UIButton()
            button.setTitle(element.rawValue, for: .normal)
            button.tintColor = .systemRed
            button.backgroundColor = .systemGreen
            stackView.addArrangedSubview(button)
        }
        return stackView
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
        view.addSubview(wateringReminder)
        view.addSubview(datePicker)

        view.addSubview(buttonStackView)
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
            $0.top.equalTo(plantNameLabel.snp.bottom).inset(-40)
        }

        plantSpeciesTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(nameTextField.snp.bottom).inset(-40)
        }

        DateOfSeedingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalTo(plantSpeciesLabel.snp.bottom).inset(-40)
        }

        datePicker.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.centerY.equalTo(DateOfSeedingLabel.snp.centerY)
            $0.width.equalTo(100)
        }

        wateringReminder.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalTo(DateOfSeedingLabel.snp.bottom).inset(-40)
        }

        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(wateringReminder.snp.bottom).inset(-30)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
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
