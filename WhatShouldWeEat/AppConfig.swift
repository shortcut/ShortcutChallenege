//
//  AppConfig.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-07.
//

import Foundation
import ShortcutFoundation

struct AppConfig: Config {
    
    func configure(_ injector: Injector) {
        
        injector.map(ViewModel.self) {
            ViewModel()
        }
        
        injector.map(DataManager.self) {
            DataManager()
        }
        
        injector.map(FoodFetcher.self) {
            FoodFetcher()
        }
        
        injector.map(Loggable.self) {
            Logger()
        }
    }
}
