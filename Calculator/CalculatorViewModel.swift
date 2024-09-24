//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Taylor Tran on 9/23/24.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    var model: CalculatorModel = CalculatorModel()
    
    var total: String {
        model.total
    }
    
    var current: String {
        model.userInput
    }
    
    
    
}

struct valueButton: View {
    let value: String
    let color: Color
    
    var body: some View {
        Button {
            print("Chose \(value)")
        } label: {
            Text("\(value)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 45, height: 45)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(color)
                    .clipShape(Circle())
        }
    }
}

struct rowOfValues: View {
    let values: [String]
    let colors: [Color]
    
    var body: some View {
        HStack {
            ForEach(0..<values.count, id: \.self) { Index in
                valueButton(value: values[Index], color: colors[Index])
            }
        }
    }
}

struct rowOfValues_preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            rowOfValues(values: ["1", "2", "3", "X",],
                        colors: [Color.gray, Color.gray, Color.gray, Color.orange])
        }
    }
}
