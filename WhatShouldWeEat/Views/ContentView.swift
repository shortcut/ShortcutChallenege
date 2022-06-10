//
//  ContentView.swift
//  ShortcutChallenge
//
//  Created by joakim lundberg on 2022-06-01.
//

import SwiftUI
import ShortcutFoundation

struct ContentView: View {
    
    @InjectObject var vm: ViewModel
    
    @State var showFood = true
    @State var showDessert = false
    @State var showCoffee = false
    
    @State var showFavorites = false
    @State var showPopover = false
    
    @State var selectedFood = Food()
        
    var body: some View {
        VStack {
            VStack {
                
                Text("What should we eat?")
                    .font(.title)
                    .underline()
               
                Divider()
                    .popover(isPresented: $showPopover) {
                        if showFood {
                            FoodView(randomFood: vm.selectedFood ?? Food())
                        }
                        else if showDessert {
                            DessertView(ramdomDessert: vm.selectedDessert ?? Dessert(id: 1, variety: "", topping: "", flavor: ""))
                        }
                        else if showCoffee {
                            CoffeeView(randomCoffee: vm.selectedCoffee ?? Coffee(id: 1, blendName: "", origin: "", variety: "", notes: "", intensifier: ""))
                        }
                        
                    }
                    .background(Color.blue)
                if showFood {
                    if showFavorites {
                        List {
                            ForEach(vm.savedFood, id: \.id) { food in
                                HStack {
                                    Text(food.dish)
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                .padding(5)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    vm.selectedFood = food
                                    showPopover = true
                                }
                            }.onDelete(perform: removeRow)
                        }.listStyle(.plain)
                    }
                    else {
                        if vm.loading {
                            ProgressView()
                                .frame(width: 60, height: 60, alignment: .center)
                        }
                        else {
                            if let randomFood = vm.randomFood {
                                FoodView(randomFood: randomFood)
                            }
                        }
                      
                    }
                }
                if showDessert {
                    if showFavorites {
                        List {
                            ForEach(vm.savedDesserts, id: \.id) { dessert in
                                HStack {
                                    Text(dessert.variety)
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                .padding(5)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    vm.selectedDessert = dessert
                                    showPopover = true
                                }
                            }.onDelete(perform: removeRow)
                        }.listStyle(.plain)
                    }
                    else {
                        if vm.loading {
                            ProgressView()
                                .frame(width: 60, height: 60, alignment: .center)
                        }
                        else {
                            if let randomDessert = vm.randomDessert {
                                DessertView(ramdomDessert: randomDessert)
                            }
                        }
                    }
                }
                if showCoffee {
                    if showFavorites {
                        List {
                            ForEach(vm.savedCoffees, id: \.id) { coffee in
                                HStack {
                                    Text(coffee.variety)
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                .padding(5)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    vm.selectedCoffee = coffee
                                    showPopover = true
                                }
                            }.onDelete(perform: removeRow)
                        }.listStyle(.plain)
                            
                    }
                    else {
                        if vm.loading {
                            ProgressView()
                                .frame(width: 60, height: 60, alignment: .center)
                        }
                        else {
                            if let randomCoffee = vm.randomCoffee {
                                CoffeeView(randomCoffee: randomCoffee)
                            }
                        }
                    }
                }
            }
            
            VStack {
                Divider()
                    .background(Color.blue)
                HStack {
                    Button(action: {
                        showFood = true
                        showDessert = false
                        showCoffee = false

                        if showFavorites == false {
                            vm.getFood(getFood: true, getDessert: false, getCoffee: false)
                        }
                    }) {
                        Text("Food")
                            .frame(width: 110, height: 55, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                    }
                  
                    Button(action: {
                        showFood = false
                        showDessert = true
                        showCoffee = false

                        if showFavorites == false {
                            vm.getFood(getFood: false, getDessert: true, getCoffee: false)
                        }
                    }) {
                        Text("Dessert")
                            .frame(width: 110, height: 55, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                    }
                    
                    Button(action: {
                        showFood = false
                        showDessert = false
                        showCoffee = true

                        if showFavorites == false {
                            vm.getFood(getFood: false, getDessert: false, getCoffee: true)
                        }
                    }) {
                        Text("Coffee")
                            .frame(width: 110, height: 55, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                    }
              
                }
            }
            if showFavorites == false {
                Button(action: {
                    if showFood {
                        vm.saveFavoriteFood()
                        
                    }
                    if showDessert {
                        vm.saveFavoriteDessert()
                    }
                    if showCoffee {
                        vm.saveFavoriteCoffee()
                    }
                }) {
                    Image(systemName: "heart.fill")
                        .frame(width: 110, height: 55, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(Color.accentColor)
                    .cornerRadius(20)
                }
            }
           
            HStack {
                Toggle("Show favorites", isOn: $showFavorites)
                    .padding(.horizontal, 110)
            }
        }
    }
    
    func removeRow(at offsets: IndexSet) {
        if showFood == true {
            vm.savedFood.remove(atOffsets: offsets)
            vm.saveFood()
        }
        if showDessert == true {
            vm.savedDesserts.remove(atOffsets: offsets)
            vm.saveDesserts()
        }
        if showCoffee == true {
            vm.savedCoffees.remove(atOffsets: offsets)
            vm.saveCoffees()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
