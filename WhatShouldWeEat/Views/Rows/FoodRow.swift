//
//  FoodRow.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-13.
//

import SwiftUI

struct FoodRow: View {
    
    let food: Food
    
    var body: some View {
        HStack {
            Image("food")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
            Text(food.dish)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.trailing)

            Spacer()
            Image("foodIngridients")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
            Text(food.ingredient)
                .font(.subheadline)
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: Food())
    }
}
