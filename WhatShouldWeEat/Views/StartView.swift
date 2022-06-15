//
//  StartView.swift
//  WhatShouldWeEat
//
//  Created by joakim lundberg on 2022-06-13.
//

import SwiftUI

struct StartView: View {
    
    @State var goFood = false
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: ContentView(), isActive: $goFood) {
                    EmptyView()
                }
                
                Image("WSWE")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                Text("What should we eat?")
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                Button(action: {
                    print("Getting food!")
                    goFood = true
                }) {
                    Text("Start")
                        .font(.headline)
                        .frame(width: 110, height: 55, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                }

            }
        }.navigationBarHidden(true)
      
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
