//
//  DaysCounterView.swift
//  EC_Reflect
//
//  Created by Irina Deeva on 31/01/23.
//

import SwiftUI

struct DaysCounterView: View {
    @ObservedObject var reflectionVM: ReflectionViewModel
    
    var body: some View {
        
        if (reflectionVM.countuniqueDays == 0) {
            Text("It's \(reflectionVM.countuniqueDays) day of reflection. Let's get started!")
                .font(.system(size: 20))
                .fontWeight(.regular)
            
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .padding(.top, 20)
        }
        
        
        if (reflectionVM.countuniqueDays == 1) {
            Text("It's \(reflectionVM.countuniqueDays) day of reflection. Great job!")
                .font(.system(size: 20))
                .fontWeight(.regular)
            
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .padding(.top, 20)
        }
        
        if (reflectionVM.countuniqueDays > 1) {
            Text("It's \(reflectionVM.countuniqueDays) days of reflection. Great job!")
                .font(.system(size: 20))
                .fontWeight(.regular)
            
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .padding(.top, 20)
        }
    }
}

struct DaysCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DaysCounterView(reflectionVM: ReflectionViewModel())
    }
}
