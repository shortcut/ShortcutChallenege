//
//  CoffeeRow.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-13.
//

import SwiftUI

struct CoffeeRow: View {
    
    var coffee: Coffee
    
    var body: some View {
        HStack {
            Image("coffee")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
            Text(coffee.variety)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.trailing)

            Spacer()
            Image("coffeebeans")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)

            Text(coffee.blend_name)
                .font(.subheadline)
        }    }
}

struct CoffeeRow_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeRow(coffee: Coffee())
    }
}
