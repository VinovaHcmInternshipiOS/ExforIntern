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
    init(imageView: String)
    {
        self.imageView = imageView
    }
}
struct DataMovie {
    static var share = DataMovie()
    var data: [DataCell] = [DataCell(imageView: "img1.jpeg"),DataCell(imageView: "img2.jpeg"),DataCell(imageView: "img3.jpeg"),DataCell(imageView: "img4.jpeg"),DataCell(imageView: "img5.jpeg"),DataCell(imageView: "img6.jpeg"),DataCell(imageView: "img7.jpeg"),DataCell(imageView: "img8.jpeg"),DataCell(imageView: "img9.jpeg"),DataCell(imageView: "img10.jpeg"),DataCell(imageView: "img11.jpeg"),DataCell(imageView: "img12.jpeg"),DataCell(imageView: "img13.jpeg")]
}
