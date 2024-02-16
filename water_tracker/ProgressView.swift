//
//  ProgressView.swift
//  water_tracker
//
//  Created by Mayasem Muner on 2/15/24.
//

import Foundation
import SwiftUI
struct ProgressView: View {
    var body: some View{
        
        
    HStack(alignment:.top){
    VStack(alignment:.leading){
                
                Text("Today's Water Intake")
            .foregroundColor(.gray)
                Text("2 cups / 20 cups")
                    .bold()
                    .font(.title)
            }
            .padding(.horizontal,-180)
        }
        
            VStack(spacing:70){
                
                HStack(spacing:30){
                    Image("logo")
                    
                    Image("logo")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
                HStack(spacing:30){
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
                HStack(spacing:30){
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
                HStack(spacing:30){
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                    
                    Image("V7")
                }
            }
        }
    }
        
        #Preview {
            ProgressView()
        }
