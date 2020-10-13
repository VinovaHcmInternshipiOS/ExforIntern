//
//  Users.swift
//  ExampleDelegate
//
//  Created by nguyen gia huy on 13/10/2020.
//

import Foundation
struct Users {
    var userName = String()
    var userClass = String()
    init(userName: String, userClass: String) {
        self.userName = userName
        self.userClass = userClass
    }
}
struct DataUser {
    static var share = DataUser()
    var data: [Users] = [Users(userName: "Malco", userClass: "111"),Users(userName: "Aland", userClass: "222"),Users(userName: "Tom", userClass: "333")]
}
