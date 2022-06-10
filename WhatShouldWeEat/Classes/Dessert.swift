//
//  Dessert.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-03.
//

import Foundation

struct Dessert: Codable {
    var id: Int
    var uid: UUID
    var variety: String
    var topping: String
    var flavor: String
    
    init() {
        id = 0
        uid = UUID()
        variety = ""
        topping = ""
        flavor = ""
    }
    
    init(id: Int, variety: String, topping: String, flavor: String) {
        self.id = id
        uid = UUID()
        self.variety = variety
        self.topping = topping
        self.flavor = flavor
    }
}
