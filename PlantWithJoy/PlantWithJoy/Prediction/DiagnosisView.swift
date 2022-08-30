/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The view controller that selects an image and makes a prediction using Vision and Core ML.
*/

import UIKit

class DiagnosisView: UIViewController {
    var firstRun = true

    @IBOutlet weak var UISuperView: UIView!
    let imagePredictor = ImagePredictor()
    let predictionsToShow = 5
    
    
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
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
            self.UISuperView.isHidden = true
        }
    }

    func updatePredictionLabel(_ message: String) {
        DispatchQueue.main.async {
            self.predictionLabel.text = message
        }

        if firstRun {
            DispatchQueue.main.async {
                self.firstRun = false
                self.predictionLabel.superview?.isHidden = false
            }
        }
    }

    func userSelectedPhoto(_ photo: UIImage) {
        updateImage(photo)
        updatePredictionLabel("Making predictions for the photo...")

        DispatchQueue.global(qos: .userInitiated).async {
            self.classifyImage(photo)
        }
    }

}

extension DiagnosisView {
    private func classifyImage(_ image: UIImage) {
        do {
            try self.imagePredictor.makePredictions(for: image,
                                                    completionHandler: imagePredictionHandler)
        } catch {
            print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
        }
    }

    private func imagePredictionHandler(_ predictions: [ImagePredictor.Prediction]?) {
        guard let predictions = predictions else {
            updatePredictionLabel("No predictions. (Check console log.)")
            return
        }

        let formattedPredictions = formatPredictions(predictions)

        let predictionString = formattedPredictions.joined(separator: "\n")
        updatePredictionLabel(predictionString)
    }

    private func formatPredictions(_ predictions: [ImagePredictor.Prediction]) -> [String] {
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
