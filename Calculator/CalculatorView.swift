//
//  ContentView.swift
//  Calculator
//
//  Created by Taylor Tran on 9/23/24.
//

import SwiftUI

extension Color {
    static var darkGray: Color {
        Color(white:0.32)
    }
    
    static var steelGray: Color {
        Color(white:0.65)
    }
    
    static var calcOrange: Color {
        Color(red: 1.0, green: 0.7, blue: 0.1)
    }
    
}

struct CalculatorView: View {
    
    @State var viewModel: CalculatorViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("\(viewModel.current)")
                    .foregroundColor(.white)
                    .font(.system(size: 80, weight: .light))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .padding()
                
                rowOfValues(values: ["AC", "+/-", "%", "➗"],
                            colors: [Color.steelGray, Color.steelGray, Color.steelGray, Color.calcOrange])
                
                rowOfValues(values: ["1", "2", "3", "+"],
                            colors: [Color.darkGray, Color.darkGray, Color.darkGray, Color.calcOrange])
                
                rowOfValues(values: ["4", "5", "6", "-"],
            colors: [Color.darkGray, Color.darkGray, Color.darkGray, Color.calcOrange])
                
                rowOfValues(values: ["7", "8", "9", "X"],
            colors: [Color.darkGray, Color.darkGray, Color.darkGray, Color.calcOrange])
                
                rowOfValues(values: ["0", ".", "√", "="],
                            colors: [Color.darkGray, Color.darkGray, Color.calcOrange, Color.calcOrange])
                
            }
            .padding()
        }
    }
}

struct CalculatorView_Preview: PreviewProvider {
    static var previews: some View {
        CalculatorView(viewModel: CalculatorViewModel())
    }
}
