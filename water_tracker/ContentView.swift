//
//  ContentView.swift
//  water_tracker
//
//  Created by joud alkahtany on 13/02/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var bodyWeight: String = ""
    @State private var waterIntakeRecommendation: Double?
    @State private var isButtonEnabled: Bool = true
    @FocusState private var isInputActive: Bool
    var isButtonActive: Bool {
          return !(bodyWeight.isEmpty || Double(bodyWeight) == nil)
      }
    var isInputValid: Bool {
           return !bodyWeight.isEmpty && Double(bodyWeight) != nil
       }

    var body: some View {
        NavigationView {
            VStack (alignment: .leading,spacing: 30)
            {
                
                Image("logo")
                Text("iHydrate")
                    .font(.largeTitle)
                
                
                Text("Start with iHydrate to record and track your water intake daily based on your needs and stay hydrated")
                
                
                TextField("Body weight", text: $bodyWeight)
                    .focused($isInputActive)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                   

                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            
                            Button("Done") {
                                isInputActive = false
                            }
                        }
                    }
                
                
            HStack()
           {
               Spacer()
                    
                    Button(action: {
                        calculateWaterIntake()
                        
                    }) {
                        Text("Calculate Now")
                            .foregroundColor(.white)
                            .padding()
                        
                            .background(isButtonActive ? Color.blue01 : Color.gray)
                            .cornerRadius(10)
                    }.disabled(!isInputValid)
                    Spacer()
                    
                    
                }          
            }

            
         
                
                
                
            
            
            
        }.padding()
        
    }
    
    
    
    func calculateWaterIntake() {
        guard let weight = Double(bodyWeight) else { return }
        waterIntakeRecommendation = weight * 0.035
    }
    
}



#Preview {
    ContentView()
}
