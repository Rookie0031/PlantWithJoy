//
//  AddPlantViewControllerExtension.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/04.
//
import UIKit
import Foundation

extension AddPlantViewController: UIImagePickerControllerDelegate {
    var cameraPicker: UIImagePickerController {
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = .camera
        return cameraPicker
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        picker.dismiss(animated: true)
        // Always return the original image.
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] else {
            fatalError("Picker didn't have an original image.")
        }
        guard let photo = originalImage as? UIImage else {
            fatalError("The (Camera) Image Picker's image isn't a/n \(UIImage.self) instance.")
        }

        updateImage(photo)
    }
}

import PhotosUI
extension AddPlantViewController: PHPickerViewControllerDelegate {
    var photoPicker: PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images

        let photoPicker = PHPickerViewController(configuration: config)
        photoPicker.delegate = self

        return photoPicker
    }

    /// The delegate method UIKit calls when the user selects a photo from the library.
    /// - Parameters:
    ///   - picker: A picker controller the `photoPicker` property created.
    ///   - results: An array of results. The method presumes the first result contains a photo.
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: false)

        guard let result = results.first else {
            return
        }

        result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
            if let error = error {
                print("Photo picker error: \(error)")
                return
            }

            guard let photo = object as? UIImage else {
                fatalError("The Photo Picker's image isn't a/n \(UIImage.self) instance.")
            }

            self.updateImage(photo)
        }
    }
}

// image functions
extension AddPlantViewController {
    func updateImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
            tapGuideLabel.isHidden = true
            self.imageView.clipsToBounds = true
        }
    }

    @objc func uploadImage(_ sender: UITapGestureRecognizer) {
        print("탭 인식")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            present(cameraPicker, animated: false)
            return
        }
        print("CameraPicker 작동")

        present(photoPicker, animated: false)
    }

    @objc func didPressDoneButton(_ sender: UIButton) {
        let newPlant = Myplant(imageData: self.imageView.image?.pngData() ?? Data(), nickName: self.nameTextField.text ?? "", species: plantSpeciesTextField.text ?? "", dateOfSeeding: datePicker.date, wateringDay: [1,2,3])
        Myplant.sampleData.append(newPlant)

        dismiss(animated: true)
    }
}

extension AddPlantViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
