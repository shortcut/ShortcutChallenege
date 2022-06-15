//
//  FoodFetcher.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-03.
//

import Foundation
import Combine
import SwiftUI
import ShortcutFoundation

public class FoodFetcher: ObservableObject {
            
    @Published var foodData: Data?
    @Published var dessertData: Data?
    @Published var coffeeData: Data?
    
    
    
    var networkClient = NetworkingClient(baseURL: "https://random-data-api.com/api/")
        
    var cancellables = Set<AnyCancellable>()
    
    //Change func name
    //do the same for fetching deeserts and coffee
    
    func fetchFood<T: Decodable>(path: String) -> AnyPublisher<T, Error> {
        print(path)
        let publisher = PassthroughSubject<T, Error>()
        networkClient.get(path)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    publisher.send(completion: .failure(error))
                }
            },
                  receiveValue: { (data: Data) in
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    publisher.send(decodedObject)
                    publisher.send(completion: Subscribers.Completion<Error>.finished)
                    publisher.send(completion: .finished)
                } catch {
                    
                    publisher.send(completion: Subscribers.Completion<Error>.failure(error))
                }

            })
            .store(in: &cancellables)
        return publisher.eraseToAnyPublisher()
    }
}
   
