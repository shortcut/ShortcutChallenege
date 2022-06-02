//
//  ViewModel.swift
//  ShortcutChallenge
//
//  Created by joakim lundberg on 2022-06-01.
//

import Foundation
import Combine
import SwiftUI

struct Food: Codable {
    var id: Int
    var uid: UUID
    var dish: String
    var description: String
    var ingredient: String
    var measurement: String
}
struct Dessert: Codable {
    var id: Int
    var uid: UUID
    var variety: String
    var topping: String
    var flavor: String
}
struct Coffee: Codable {
    var id: Int
    var uid: UUID
    var blend_name: String
    var origin: String
    var variety: String
    var notes: String
    var intensifier: String
    


}
@MainActor
public class ViewModel: ObservableObject {
    
    @Published var randomFood: Food?
    @Published var randomDessert: Dessert?
    @Published var randomCoffee: Coffee?
    
    @Published var savedFood = [Food]()
    @Published var savedDesserts = [Dessert]()
    @Published var savedCoffees = [Coffee]()
    
    var urlString = ""
    var savedKey = ""
    var test = ""
    
    func saveFavoriteFood() {
        if let encodedFood = try? JSONEncoder().encode(savedFood) {
            UserDefaults.standard.set(encodedFood, forKey: "FavoriteFoods")
        }
    }
    
    func loadFavoriteFood() {
        if let savedFood = UserDefaults.standard.data(forKey: "FavoriteFoods") {
            
            if let decodedFood = try? JSONDecoder().decode([Food].self, from: savedFood) {
                self.savedFood = decodedFood
            }
        }
    }
    
    func saveFavoriteDesserts() {
        if let encodedFood = try? JSONEncoder().encode(savedDesserts) {
            UserDefaults.standard.set(encodedFood, forKey: "FavoriteDesserts")
        }
    }
    
    func loadFavoriteDesserts() {
        if let savedDesserts = UserDefaults.standard.data(forKey: "FavoriteDesserts") {
            
            if let decodedDesserts = try? JSONDecoder().decode([Dessert].self, from: savedDesserts) {
                self.savedDesserts = decodedDesserts
            }
        }
    }
    
    func saveFavoriteCoffees() {
        if let encodedFood = try? JSONEncoder().encode(savedCoffees) {
            UserDefaults.standard.set(encodedFood, forKey: "FavoriteCoffees")
        }
    }
    func loadFavoriteCoffees() {
        if let savedCoffees = UserDefaults.standard.data(forKey: "FavoriteCoffees") {
            
            if let decodedCoffees = try? JSONDecoder().decode([Coffee].self, from: savedCoffees) {
                self.savedCoffees = decodedCoffees
            }
        }

    }
    
   
    func getFood(getFood: Bool, getDessert: Bool, getCoffe: Bool){
        if getFood {
            urlString = "food/random_food"
        }
        else if getDessert {
            urlString = "dessert/random_dessert"
        }
        else if getCoffe {
            urlString = "coffee/random_coffee"
        }
        
        guard let url = URL(string: "https://random-data-api.com/api/\(urlString)") else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error = \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                print("Response error")
                return
            }
            
            guard let data = data else {
                print("Data error")
                return
            }
            
            print("GOT DATA = \(data)")
            
            if getFood {
                self.decodeFood(foodData: data)
            }
            else if getDessert {
                self.decodeDessert(dessertData: data)
            }
            else if getCoffe {
                self.decodeCoffee(coffeeData: data)
            }
        }
        task.resume()
    }
    
    func decodeFood(foodData: Data) {
        randomFood = nil
        do {
            let decoder = JSONDecoder()
            let randomFood = try decoder.decode(Food.self, from: foodData)
            print("GOT A DISH!!")
            
            self.randomFood = randomFood
        }
        catch {
            print("Error decoding!!!")
            print(error)
        }
    }
    func decodeDessert(dessertData: Data) {
        randomDessert = nil
        do {
            let decoder = JSONDecoder()
            let randomDessert = try decoder.decode(Dessert.self, from: dessertData)
            print("GOT A DESSERT!!")
            
            self.randomDessert = randomDessert
        }
        catch {
            print("Error decoding!!!")
            print(error)
        }
        
    }
    func decodeCoffee(coffeeData: Data) {
        randomCoffee = nil
        do {
            let decoder = JSONDecoder()
            let randomCoffee = try decoder.decode(Coffee.self, from: coffeeData)
            print("GOR A COFFEE!!")
            self.randomCoffee = randomCoffee
        }
        catch {
            print("Error decoding!!!")
            print(error)
        }
    }
}
