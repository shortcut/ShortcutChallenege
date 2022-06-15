//
//  DessertView.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-07.
//

import SwiftUI

struct DessertView: View {
    @State var ramdomDessert: Dessert
    
    var body: some View {
        VStack {
            Image("dessert2")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)

            Text(ramdomDessert.variety)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack {
                Text("Topping: ")
                    .fontWeight(.bold)
                Text(ramdomDessert.topping)
            }.padding(.bottom)
            
            HStack {
                Text("Flavour: ")
                    .fontWeight(.bold)
                Text(ramdomDessert.flavor)

            }
        }
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView(ramdomDessert: Dessert(id: 22, variety: "Cookie", topping: "Sprinkles", flavor: "Chocolate"))
    }
}
