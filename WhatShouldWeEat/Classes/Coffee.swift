//
//  Coffee.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-03.
//

import Foundation

struct Coffee: Codable {
    var id: Int
    var uid: UUID
    var blend_name: String
    var origin: String
    var variety: String
    var notes: String
    var intensifier: String
    
    init() {
        id = 0
        uid = UUID()
        blend_name = ""
        origin = ""
        variety = ""
        notes = ""
        intensifier = ""
    }
    
    init(id: Int, blendName: String, origin: String, variety: String, notes: String, intensifier: String) {
        self.id = id
        self.uid = UUID()
        self.blend_name = blendName
        self.origin = origin
        self.variety = variety
        self.notes = notes
        self.intensifier = intensifier
    }
}

