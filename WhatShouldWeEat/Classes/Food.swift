//
//  Food.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-03.
//

import Foundation

public struct Food: Codable {
    var id: Int
    var uid: UUID
    var dish: String
    var description: String
    var ingredient: String
    var measurement: String
    
    init() {
        id = 0
        uid = UUID()
        dish = ""
        description = ""
        ingredient = ""
        measurement = ""
    }
    
    init(id: Int, dish: String, description: String, ingredient: String, measurement: String){
        self.id = id
        self.uid = UUID()
        self.dish = dish
        self.description = description
        self.ingredient = ingredient
        self.measurement = measurement
    }
}
