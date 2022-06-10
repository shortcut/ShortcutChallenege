//
//  FoodFetcher.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-03.
//

import Foundation
import Combine
import SwiftUI

public class FoodFetcher: ObservableObject {
            
    @Published var foodData: Data?
    @Published var dessertData: Data?
    @Published var coffeeData: Data?
        
    var cancellables = Set<AnyCancellable>()
    
    //Change func name
    //do the same for fetching deeserts and coffee
    
    func fetchFood() -> AnyPublisher<Food, Never> {
        
        let url = URL(string: "https://random-data-api.com/api/food/random_food")!
        
        let publisher = PassthroughSubject<Food, Never>()
         URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Food.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                _ in
                
            }, receiveValue: { randomFood in
                publisher.send(randomFood)
            })
            .store(in: &cancellables)
        
        return publisher.eraseToAnyPublisher()
    }
    
    func fetchDessert() -> AnyPublisher<Dessert, Never> {
        
        let url = URL(string: "https://random-data-api.com/api/dessert/random_dessert")!
        
        let publisher = PassthroughSubject<Dessert, Never>()
         URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Dessert.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                _ in
                
            }, receiveValue: { randomDessert in
                publisher.send(randomDessert)
            })
            .store(in: &cancellables)
        
        return publisher.eraseToAnyPublisher()
        
    }
    
    func fetchCoffee() -> AnyPublisher<Coffee, Never> {
        
        let url = URL(string: "https://random-data-api.com/api/coffee/random_coffee")!
        
        let publisher = PassthroughSubject<Coffee, Never>()
         URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Coffee.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                _ in
                
            }, receiveValue: { randomCoffee in
                publisher.send(randomCoffee)
            })
            .store(in: &cancellables)
        
        return publisher.eraseToAnyPublisher()

    }
}

