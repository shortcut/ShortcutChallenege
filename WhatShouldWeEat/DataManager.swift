//
//  DataManager.swift
//  ShortcutChallenge
//
//  Created by joakim lundberg on 2022-06-02.
//

import Foundation
import Combine

public class DataManager: ObservableObject {
            
    func saveFavoriteFood(foodToSave: [Food]) {
        if let encodedFood = try? JSONEncoder().encode(foodToSave) {
            UserDefaults.standard.set(encodedFood, forKey: "FavoriteFoods")
        }
    }
    
    func loadFavoriteFood() -> [Food] {
        
        var savedFood = [Food]()
        
        if let savedFoodData = UserDefaults.standard.data(forKey: "FavoriteFoods") {
            
            if let decodedFood = try? JSONDecoder().decode([Food].self, from: savedFoodData) {
                savedFood = decodedFood
            }
        }
        return savedFood
    }
    
    func saveFavoriteDesserts(dessertsToSave: [Dessert]) {
        if let encodedDesserts = try? JSONEncoder().encode(dessertsToSave) {
            UserDefaults.standard.set(encodedDesserts, forKey: "FavoriteDesserts")
        }
    }
    
    func loadFavoriteDesserts() -> [Dessert] {
        
        var savedDesserts = [Dessert]()
        
        if let savedDessertsData = UserDefaults.standard.data(forKey: "FavoriteDesserts") {
            
            if let decodedDesserts = try? JSONDecoder().decode([Dessert].self, from: savedDessertsData) {
                savedDesserts = decodedDesserts
            }
        }
        return savedDesserts
    }
    
    func saveFavoriteCoffees(coffeesToSave: [Coffee]) {
        if let encodedFood = try? JSONEncoder().encode(coffeesToSave) {
            UserDefaults.standard.set(encodedFood, forKey: "FavoriteCoffees")
        }
    }
    func loadFavoriteCoffees() -> [Coffee] {
        
        var savedCoffees = [Coffee]()
        
        if let savedCoffeesData = UserDefaults.standard.data(forKey: "FavoriteCoffees") {
            
            if let decodedCoffees = try? JSONDecoder().decode([Coffee].self, from: savedCoffeesData) {
                savedCoffees = decodedCoffees
                
            }
        }
        return savedCoffees
    }
    
}
