//
//  ViewModel.swift
//  ShortcutChallenge
//
//  Created by joakim lundberg on 2022-06-01.
//

import Foundation
import Combine
import SwiftUI
import ShortcutFoundation

public class ViewModel: ObservableObject {
    
    @Published var randomFood: Food?
    @Published var randomDessert: Dessert?
    @Published var randomCoffee: Coffee?
    
    @Published var selectedFood: Food?
    @Published var selectedDessert: Dessert?
    @Published var selectedCoffee: Coffee?
        
    @Published var savedFood = [Food]()
    @Published var savedDesserts = [Dessert]()
    @Published var savedCoffees = [Coffee]()
    
    @Published var loading = false
    
    @InjectObject var dataManager: DataManager
    @InjectObject var foodFetcher: FoodFetcher
                        
    var cancellables = [AnyCancellable]()

    init() {
                        
        foodFetcher.fetchFood()
            .sink {
                self.randomFood = $0
            }
            .store(in: &cancellables)
                
        loadFavoriteFood()
        loadFavoriteDesserts()
        loadFavoriteCoffees()
    }
    func saveFavoriteFood() {
        if let randomFood = randomFood {
            savedFood.append(randomFood)
        }
        dataManager.saveFavoriteFood(foodToSave: savedFood)
    }
    
    func loadFavoriteFood() {
        savedFood = dataManager.loadFavoriteFood()
    }
    
    func saveFavoriteDessert() {
        if let randomDessert = randomDessert {
            savedDesserts.append(randomDessert)
        }
        dataManager.saveFavoriteDesserts(dessertsToSave: savedDesserts)
        
    }
    
    func loadFavoriteDesserts() {
        savedDesserts = dataManager.loadFavoriteDesserts()
    }
    
    func saveFavoriteCoffee() {
        if let randomCoffee = randomCoffee {
            savedCoffees.append(randomCoffee)
        }
        dataManager.saveFavoriteCoffees(coffeesToSave: savedCoffees)
        
    }
    func loadFavoriteCoffees() {
        savedCoffees = dataManager.loadFavoriteCoffees()
    }
    
    func getFood(getFood: Bool, getDessert: Bool, getCoffee: Bool){
       loading = true
        if getFood {
            self.randomFood = nil
            foodFetcher.fetchFood()
                .sink {
                    self.randomFood = $0
                    self.loading = false
                }
                .store(in: &cancellables)
        }
        else if getDessert {
            self.randomDessert = nil
            foodFetcher.fetchDessert()
                .sink {
                    self.randomDessert = $0
                    self.loading = false
                }
                .store(in: &cancellables)
        }
        else if getCoffee {
            self.randomCoffee = nil
            foodFetcher.fetchCoffee()
                .sink {
                    self.randomCoffee = $0
                    self.loading = false
                }
                .store(in: &cancellables)
                    
            }
    }
    
    func saveFood() {
        dataManager.saveFavoriteFood(foodToSave: savedFood)
    }
    func saveDesserts() {
        dataManager.saveFavoriteDesserts(dessertsToSave: savedDesserts)
    }
    func saveCoffees() {
        dataManager.saveFavoriteCoffees(coffeesToSave: savedCoffees)
    }
    
}
