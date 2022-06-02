//
//  ContentView.swift
//  ShortcutChallenge
//
//  Created by joakim lundberg on 2022-06-01.
//

import SwiftUI

struct FoodView: View {
    
    @State var randomFood: Food
    
    var body: some View {
        VStack {
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

struct DessertView: View {
    
    @State var ramdomDessert: Dessert
    
    var body: some View {
        VStack {
            Text(ramdomDessert.variety)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.bottom)
            Text("Topping: " + ramdomDessert.topping)
                .padding(.bottom)
            Text("Flavor: " + ramdomDessert.flavor)
        }
    }
}

struct CoffeeView: View {
    
    @State var randomCoffee: Coffee
    
    var body: some View {
        VStack {
            Text(randomCoffee.blend_name)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.bottom)
            Text("Variety; " + randomCoffee.variety)
                .padding(.bottom)
            Text("Origin: " + randomCoffee.origin)
                .padding(.bottom)
            Text("Notes: " + randomCoffee.notes)
                .padding(.bottom)
            
        }
    }
}

struct ContentView: View {
    
   @StateObject var vm = ViewModel()
    
    @State var showFood = false
    @State var showDessert = false
    @State var showCoffee = false
    
    @State var showFavorites = false
        
    var body: some View {
        VStack() {
            VStack {
                
                Text("What should we eat?")
                    .font(.title)
                    .underline()
                Divider()
                    .background(Color.blue)
                
                if showFood {
                    if let randomFood = vm.randomFood {
                        FoodView(randomFood: randomFood)
                    }
                }
                
                if showDessert {
                    if let randomDessert = vm.randomDessert {
                        DessertView(ramdomDessert: randomDessert)
                    }
                }
               
                if showCoffee {
                    if let randomCoffee = vm.randomCoffee {
                        CoffeeView(randomCoffee: randomCoffee)
                    }
                }
                
            }
            
            VStack {
                Divider()
                    .background(Color.blue)
                HStack {
                    Button("Food") {
                        print("Getting food")
                        showFood = true
                        showDessert = false
                        showCoffee = false

                        vm.getFood(getFood: true, getDessert: false, getCoffe: false)
                    }
                    .frame(width: 80, height: 20, alignment: .center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Button("Dessert") {
                        print("Getting dessert")
                        showFood = false
                        showDessert = true
                        showCoffee = false

                        vm.getFood(getFood: false, getDessert: true, getCoffe: false)
                    }
                    .frame(width: 80, height: 20, alignment: .center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Button("Doffee") {
                        print("Getting coffee")
                        showFood = false
                        showDessert = false
                        showCoffee = true

                        vm.getFood(getFood: false, getDessert: false, getCoffe: true)
                    }
                    .frame(width: 80, height: 20, alignment: .center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
            }
            if showFavorites == false {
                Button {
                    print("Adding to favourites!!")
                    if showFood {
                        print("Adding food")
                        vm.saveFavoriteFood()
                    }
                    if showDessert {
                        print("Adding dessert")
                        vm.saveFavoriteDesserts()
                    }
                    if showCoffee {
                        print("Adding coffee")
                        vm.saveFavoriteCoffees()
                    }
                } label: {
                    Image(systemName: "heart.fill")
                }
                .frame(width: 90, height: 20, alignment: .center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
           
            HStack {
                Toggle("Show favorites", isOn: $showFavorites)
                    .padding(.horizontal, 110)
            }

            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
