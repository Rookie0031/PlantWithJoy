/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The view controller that selects an image and makes a prediction using Vision and Core ML.
*/

import UIKit
import AVFoundation

class DiagnosisView: UIViewController {
    var firstRun = true
    let plantStatusPrediction = PlantStatusPrediction()
    let plantDiseasePrediction = PlantDiseasePrediction()
    let predictionsToShow = 3
    let diseasePredictionsToShow = 3

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var guideLabel: UILabel!
    //    var reportView: UIView = {
    @IBOutlet weak var pictureGuideView: UIView!
    //        let baseView = UIView()
//        baseView.backgroundColor = .blue
//        return baseView
//    }()
    
    var reportViewTitle: UILabel = {
        let label = UILabel()
//        label.text = "Report"
        label.textColor = .black
        return label
    }()

    var plantStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Plant Status"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 17)

        return label
    }()

    var predictionLabel: UITextView = {
        let label = UITextView()
        label.text = "Diagnosis Result"
        return label
    }()

    var possibleDiseaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Possible Disease"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    var possibleDiseaseDiagnosis: UITextView = {
        let label = UITextView()
        label.text = "Rust"
        return label
    }()

    var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    var seeAlsoButton: UIButton = {
        let button = UIButton()
        button.setTitle("See Also", for: .normal)
        button.titleLabel?.textColor = .white
        return button
    }()
    
    @IBOutlet var UISuperView: UIView!


    private func configureSubview() {
//        self.view.addSubview(reportView)
        self.view.addSubview(reportViewTitle)
        self.view.addSubview(plantStatusLabel)
        self.view.addSubview(predictionLabel)
        self.view.addSubview(possibleDiseaseLabel)
        self.view.addSubview(possibleDiseaseDiagnosis)
        self.view.addSubview(imageView)
        self.view.addSubview(seeAlsoButton)
    }

    private func setConstraintOption() {
//        reportView.translatesAutoresizingMaskIntoConstraints = false
        reportViewTitle.translatesAutoresizingMaskIntoConstraints = false
        plantStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        predictionLabel.translatesAutoresizingMaskIntoConstraints = false
        possibleDiseaseLabel.translatesAutoresizingMaskIntoConstraints = false
        possibleDiseaseDiagnosis.translatesAutoresizingMaskIntoConstraints = false
        plantStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        seeAlsoButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setConstraintForAll() {

        NSLayoutConstraint.activate([
            reportViewTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            reportViewTitle.topAnchor.constraint(equalTo: view.topAnchor),
        ])

        NSLayoutConstraint.activate([
            plantStatusLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            plantStatusLabel.topAnchor.constraint(equalTo: reportViewTitle.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            predictionLabel.leadingAnchor.constraint(equalTo: plantStatusLabel.leadingAnchor, constant: 5),
            predictionLabel.topAnchor.constraint(equalTo: plantStatusLabel.bottomAnchor),
            predictionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            predictionLabel.heightAnchor.constraint(equalToConstant: 300)
        ])

        NSLayoutConstraint.activate([
            possibleDiseaseLabel.leftAnchor.constraint(equalTo: plantStatusLabel.leftAnchor),
            possibleDiseaseLabel.topAnchor.constraint(equalTo: plantStatusLabel.bottomAnchor, constant: 100)
        ])

        NSLayoutConstraint.activate([
            possibleDiseaseDiagnosis.leftAnchor.constraint(equalTo: possibleDiseaseLabel.leftAnchor),
            possibleDiseaseDiagnosis.topAnchor.constraint(equalTo: possibleDiseaseLabel.bottomAnchor),
            possibleDiseaseDiagnosis.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            possibleDiseaseDiagnosis.heightAnchor.constraint(equalToConstant: 300)
        ])

        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130)
        ])

        NSLayoutConstraint.activate([
            seeAlsoButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 40),
            seeAlsoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 40),
            seeAlsoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            seeAlsoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 70)
        ])

    }

}

extension DiagnosisView {
    
    @IBAction func singleTap() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            present(photoPicker, animated: false)
            return
        }
        print("CameraPicker 작동")

        present(cameraPicker, animated: false)
    }
}

extension DiagnosisView {
    func updateImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
            self.imageView.layer.cornerRadius = 50
            self.UISuperView.isHidden = true
        }
    }

    func updatePredictionLabel(_ message: String) {
        DispatchQueue.main.async {
            self.predictionLabel.text = message
            self.predictionLabel.setLineAndLetterSpacing(message)

            print("upDate Prediction Label \(message)")
            self.introLabel.isHidden = true
            self.guideLabel.isHidden = true
            self.pictureGuideView.isHidden = true
            
            self.configureSubview()
            self.setConstraintOption()
            self.setConstraintForAll()
        }

        if firstRun {
            DispatchQueue.main.async {
                self.firstRun = false
                self.predictionLabel.superview?.isHidden = false
            }
        }
    }

    func updateDiseaseLabel(_ message: String) {
        DispatchQueue.main.async {
            self.possibleDiseaseDiagnosis.text = message
            self.possibleDiseaseDiagnosis.setLineAndLetterSpacing(message)
        }
    }

    func userSelectedPhoto(_ photo: UIImage) {
        updateImage(photo)
        updatePredictionLabel("Making predictions for the photo...")

        // 예측 모델 작동
        DispatchQueue.global(qos: .userInitiated).async {
            self.classifyStatus(photo)
            self.classifyDisease(photo)
        }
    }

}

//Status 예측
extension DiagnosisView {
    private func classifyStatus(_ image: UIImage) {
        do {
            try self.plantStatusPrediction.makePredictions(for: image,
                                                    completionHandler: imagePredictionHandler)
        } catch {
            print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
        }
    }

    private func imagePredictionHandler(_ predictions: [PlantStatusPrediction.Prediction]?) {
        guard let predictions = predictions else {
            updatePredictionLabel("No predictions. (Check console log.)")
            return
        }

        let formattedPredictions = formatPredictions(predictions)

        let predictionString = formattedPredictions.joined(separator: "\n")
        print("Imagehandler의 라벨 \(predictionString)")
        updatePredictionLabel(predictionString)
    }

    private func formatPredictions(_ predictions: [PlantStatusPrediction.Prediction]) -> [String] {
        let topPredictions: [String] = predictions.prefix(predictionsToShow).map { prediction in
            var name = prediction.classification

            if let firstComma = name.firstIndex(of: ",") {
                name = String(name.prefix(upTo: firstComma))
            }

            return "\(name) - \(prediction.confidencePercentage)%"
        }

        return topPredictions
    }
}

// Disease 예측
extension DiagnosisView {
    private func classifyDisease(_ image: UIImage) {
        do {
            try self.plantDiseasePrediction.makePredictions(for: image,
                                                    completionHandler: imagePredictionHandler)
        } catch {
            print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
        }
    }

    private func imagePredictionHandler(_ predictions: [PlantDiseasePrediction.Prediction]?) {
        guard let predictions = predictions else {
            updateDiseaseLabel("No predictions. (Check console log.)")
            return
        }

        let formattedPredictions = formatPredictions(predictions)

        let predictionString = formattedPredictions.joined(separator: "\n")
        print("질병 예측하기 \(predictionString)")
        updateDiseaseLabel(predictionString)
    }

    private func formatPredictions(_ predictions: [PlantDiseasePrediction.Prediction]) -> [String] {
        let topPredictions: [String] = predictions.prefix(predictionsToShow).map { prediction in
            var name = prediction.classification

            if let firstComma = name.firstIndex(of: ",") {
                name = String(name.prefix(upTo: firstComma))
            }

            return "\(name) - \(prediction.confidencePercentage)%"
        }

        return topPredictions
    }
}
