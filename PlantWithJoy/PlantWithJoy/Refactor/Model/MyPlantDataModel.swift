//
//  MyPlantDataModel.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/04.
//
import UIKit
import Foundation

struct Myplant: Identifiable {
    let id: String
    let imageData: Data
    let nickName: String
    let species: String
    let dateOfSeeding: Date
    let wateringDay: Set<Int>
}

#if DEBUG
extension Myplant {
    static var sampleData = [
        Myplant(id: UUID().uuidString, imageData: UIImage(named: "TestPlant")?.pngData() ?? Data(), nickName: "Dino", species: "dinosaurs", dateOfSeeding: Date(), wateringDay: [1,2,3]),
        Myplant(id: UUID().uuidString, imageData: UIImage(named: "LogInPicture")?.pngData() ?? Data(), nickName: "Niniz", species: "Big leaf", dateOfSeeding: Date(), wateringDay: [3,4,5]),
        Myplant(id: UUID().uuidString, imageData: UIImage(named: "TestPlant")?.pngData() ?? Data(), nickName: "Cling", species: "Sharp root", dateOfSeeding: Date(), wateringDay: [5,6,7])
    ]
}
#endif
