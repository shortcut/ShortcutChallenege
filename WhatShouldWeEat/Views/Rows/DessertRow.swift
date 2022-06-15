//
//  DessertRow.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-13.
//

import SwiftUI

struct DessertRow: View {
    
    let dessert: Dessert
    
    var body: some View {
        HStack {
            Image("dessert2")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
            Text(dessert.variety)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.trailing)

            Spacer()
            Image("dessertingridient")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)

            Text(dessert.topping)
                .font(.subheadline)
        }
    }
}

struct DessertRow_Previews: PreviewProvider {
    static var previews: some View {
        DessertRow(dessert: Dessert())
    }
}
