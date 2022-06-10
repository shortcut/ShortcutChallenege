//
//  FoodView.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-07.
//

import SwiftUI

struct FoodView: View {
    @State var randomFood: Food
    
    var body: some View {
        VStack {
            Image("food")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)

            Text(randomFood.dish)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("Ingrident: " + randomFood.ingredient)
                .padding(.bottom)
            Text("Description: " + randomFood.description)
                .padding(.horizontal)
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(randomFood: Food(id: 12, dish: "Pasta", description: "----", ingredient: "Tomatoes", measurement: "Medium"))
    }
}
