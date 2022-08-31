//
//  PlantDiseasePrediction.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/08/31.
//

import Vision
import UIKit

class PlantDiseasePrediction {
    /// - Tag: name
    static func createImageClassifier() -> VNCoreMLModel {

        let defaultConfig = MLModelConfiguration()
        let imageClassifierWrapper = try? DiseaseDetection(configuration: defaultConfig)

        guard let imageClassifier = imageClassifierWrapper else {
            fatalError("App failed to create an image classifier model instance.")
        }

        let imageClassifierModel = imageClassifier.model

        guard let imageClassifierVisionModel = try? VNCoreMLModel(for: imageClassifierModel) else {
            fatalError("App failed to create a `VNCoreMLModel` instance.")
        }

        return imageClassifierVisionModel
    }

    private static let imageClassifier = createImageClassifier()

    struct Prediction {

        let classification: String
        let confidencePercentage: String
    }

    typealias ImagePredictionHandler = (_ predictions: [Prediction]?) -> Void


    private var predictionHandlers = [VNRequest: ImagePredictionHandler]()
    private func createImageClassificationRequest() -> VNImageBasedRequest {

        let imageClassificationRequest = VNCoreMLRequest(model: PlantDiseasePrediction.imageClassifier,
                                                         completionHandler: visionRequestHandler)

        imageClassificationRequest.imageCropAndScaleOption = .centerCrop
        return imageClassificationRequest
    }

    func makePredictions(for photo: UIImage, completionHandler: @escaping ImagePredictionHandler) throws {
        let orientation = CGImagePropertyOrientation(photo.imageOrientation)

        guard let photoImage = photo.cgImage else {
            fatalError("Photo doesn't have underlying CGImage.")
        }

        let imageClassificationRequest = createImageClassificationRequest()
        predictionHandlers[imageClassificationRequest] = completionHandler

        let handler = VNImageRequestHandler(cgImage: photoImage, orientation: orientation)
        let requests: [VNRequest] = [imageClassificationRequest]

        try handler.perform(requests)
    }

    private func visionRequestHandler(_ request: VNRequest, error: Error?) {
        // Remove the caller's handler from the dictionary and keep a reference to it.
        guard let predictionHandler = predictionHandlers.removeValue(forKey: request) else {
            fatalError("Every request must have a prediction handler.")
        }

        var predictions: [Prediction]? = nil

        defer {
            predictionHandler(predictions)
        }

        if let error = error {
            print("Vision image classification error...\n\n\(error.localizedDescription)")
            return
        }

        if request.results == nil {
            print("Vision request had no results.")
            return
        }

        guard let observations = request.results as? [VNClassificationObservation] else {
            print("VNRequest produced the wrong result type: \(type(of: request.results)).")
            return
        }

        predictions = observations.map { observation in
            Prediction(classification: observation.identifier,
                       confidencePercentage: observation.confidencePercentageString)
        }
    }
}

