//
//  DataCollection.swift
//  Collection&Table
//
//  Created by nguyen gia huy on 09/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import Foundation
struct DataCell {
    var imageView = String()
    var position = Int()
    init(imageView: String,position: Int)
    {
        self.imageView = imageView
        self.position = position
    }
}
struct DataMovie {
    static var share = DataMovie()
    var data: [DataCell] = [DataCell(imageView: "img1.jpeg",position: 0),DataCell(imageView: "img2.jpeg",position: 0),DataCell(imageView: "img3.jpeg",position: 0),DataCell(imageView: "img4.jpeg",position: 0),DataCell(imageView: "img5.jpeg",position: 0),DataCell(imageView: "img6.jpeg",position: 0),DataCell(imageView: "img7.jpeg",position: 0),DataCell(imageView: "img8.jpeg",position: 0),DataCell(imageView: "img9.jpeg",position: 0),DataCell(imageView: "img10.jpeg",position: 0),DataCell(imageView: "img11.jpeg",position: 0),DataCell(imageView: "img12.jpeg",position: 0),DataCell(imageView: "img13.jpeg",position: 0)]
}
