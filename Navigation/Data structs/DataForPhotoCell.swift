//
//  dataForPhotoCell.swift
//  Navigation
//
//  Created by Владимир on 27.04.2023.
//

import UIKit

struct DataForPhotoCell {
    var firstPhoto: String
    var secondPhoto: String
    var thirdPhoto: String
    var fourthPhoto: String
}

extension DataForPhotoCell {
    static func makeArray() -> [DataForPhotoCell] {
        [DataForPhotoCell(firstPhoto: "PhotoCell1",
                          secondPhoto: "PhotoCell2",
                          thirdPhoto: "PhotoCell3",
                          fourthPhoto: "PhotoCell4")]
    }
    
    static func makeTwentyPhotos() -> [String] {
        var array: [String] = []
        for i in 1...20 {
            array.append("PhotoCell\(i)")
        }
        return array
    }
}
