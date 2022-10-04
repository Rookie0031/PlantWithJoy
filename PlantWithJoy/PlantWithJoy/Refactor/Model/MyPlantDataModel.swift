//
//  MyPlantDataModel.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/04.
//

import Foundation

struct Myplant {
    let imageData: Data
    let nickName: String
    let species: String
    let dateOfSeeding: Date
    let wateringDay: [Int]
}

#if DEBUG
extension Myplant {
    static var sampleData = [
    Myplant(imageData: Data(), nickName: "Dino", species: "dinosaurs", dateOfSeeding: Date(), wateringDay: [1,2,3]),
    Myplant(imageData: Data(), nickName: "Niniz", species: "Big leaf", dateOfSeeding: Date(), wateringDay: [3,4,5]),
    Myplant(imageData: Data(), nickName: "Cling", species: "Sharp root", dateOfSeeding: Date(), wateringDay: [1])
    ]
}
#endif
