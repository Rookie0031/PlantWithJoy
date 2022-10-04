//
//  AddPlantViewController.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/03.
//
import SnapKit
import UIKit
import Foundation

class AddPlantViewController: UIViewController, UINavigationControllerDelegate {

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray6
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nickname of plant"
        return textField
    }()

    let plantSpeciesTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Species of plant"
        return textField
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()

    lazy var dayListButtonArray: [UIButton] = []

    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        let dayList = WeekDay.allCases

        for element in dayList {
            let button = UIButton()
            button.setTitle(element.rawValue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 15)

            button.snp.makeConstraints {
                $0.width.equalTo(20)
                $0.height.equalTo(10)
            }
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemGreen
            stackView.addArrangedSubview(button)
            self.dayListButtonArray.append(button)
        }
        return stackView
    }()

    let doneButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addsubViews()
        configureUI()
        setDelegate()
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(uploadImage(_:))))

        doneButton.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)
    }

    private func setDelegate() {
        nameTextField.delegate = self
        plantSpeciesTextField.delegate = self
        cameraPicker.delegate = self
    }

    private func addsubViews() {
        view.addSubview(imageView)
        imageView.addSubview(tapGuideLabel)

        view.addSubview(addPlantViewTitleLabel)
        view.addSubview(plantNameLabel)
        view.addSubview(nameTextField)

        view.addSubview(plantSpeciesLabel)
        view.addSubview(plantSpeciesTextField)

        view.addSubview(DateOfSeedingLabel)
        view.addSubview(wateringReminder)
        view.addSubview(datePicker)

        view.addSubview(buttonStackView)
        view.addSubview(doneButton)
    }
    
    private func configureUI() {
        addPlantViewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }

        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(addPlantViewTitleLabel.snp.bottom).inset(-30)
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }

        tapGuideLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
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

        doneButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(50)
        }

    }
}

import SwiftUI
struct VCPreView:PreviewProvider {
    static var previews: some View {
        AddPlantViewController().toPreview()
    }
}
