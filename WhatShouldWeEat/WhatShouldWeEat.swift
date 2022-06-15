//
//  WhatShouldWeEat.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-01.
//

import SwiftUI
import ShortcutFoundation

@main
struct WhatShouldWeEat: App {
    
    let context = Context(AppConfig())
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
