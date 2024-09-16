//
//  DaysCounterView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 31/01/23.
//

import SwiftUI

struct DaysCounterView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var reflectionVM: ReflectionViewModel
    @ObservedObject var profileVM: ProfileViewModel
    
    var body: some View {
        
        
        if (profileVM.dayTrackingMode == DayTrackingMode.total){
            
            if (reflectionVM.uniqueDaysСounter == 0) {
                Text("Let's get started!")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(colorScheme == .light ? .black : .white)
            }
            
            
            if (reflectionVM.uniqueDaysСounter == 1) {
                Text("The first day of reflection is done.")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
            }
            
            if (reflectionVM.uniqueDaysСounter > 1) {
                Text("It's \(reflectionVM.uniqueDaysСounter) days of reflection in total.")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
            }
            
        }
        if (profileVM.dayTrackingMode == DayTrackingMode.streak){
            
            if (reflectionVM.daysInRowCounter == 0 && reflectionVM.todayCounter == 0) {
                Text("Let's get started!")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(colorScheme == .light ? .black : .white)
            }
            
            
            if (reflectionVM.todayCounter == 1) {
                Text("The first day of reflection is done.")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
            }
            
            if (reflectionVM.daysInRowCounter > 1) {
                Text("You are on a \(reflectionVM.daysInRowCounter) day streak.")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
            }
            
            
        }
            
    }
}

struct DaysCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DaysCounterView(reflectionVM: ReflectionViewModel(), profileVM: ProfileViewModel())
    }
}
