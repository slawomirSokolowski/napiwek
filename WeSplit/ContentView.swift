//
//  ContentView.swift
//  WeSplit
//
//  Created by slawomir  on 04/04/2020.
//  Copyright © 2020 slawomir . All rights reserved.
//

import SwiftUI

struct ContentView: View {
 @State private var wstawKwote = ""
 @State private var iloscOsob = 2
 @State private var napiwekProcentowo = 2
    
 let tipPercentages = [5, 10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(iloscOsob + 2)
        let tipSelection = Double(tipPercentages[napiwekProcentowo])
        let orderAmount = Double(wstawKwote) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Kwota do podziału", text: $wstawKwote)
                    
                    Picker("ilość osób", selection: $iloscOsob) {
                        ForEach(2 ..< 100) {
                            Text("\($0)) osób")
                        }
                    }
                }
                Section (header: Text("  + % napiwku ")) {
                
                   Picker("Tip percentage", selection: $napiwekProcentowo) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                      }
                   .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("PLN \(totalPerPerson, specifier: "%.2f")")
                }
            .navigationBarTitle("Napiwek")
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

