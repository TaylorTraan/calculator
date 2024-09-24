//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Taylor Tran on 9/23/24.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    @Published var model: CalculatorModel = CalculatorModel()
    
    var total: String {
        model.total
    }
    
    var current: String {
        model.userInput
    }
    
    var current2: String {
        model.userInput2
    }
    
    var operation: String {
        model.currentOperation
    }
    
    var userView: Int {
        model.view
    }
    
    func appendToCurrent(value: String) {
        model.appendToCurrent(value: value)
    }
    
    
    func clear() {
        model.clear()
    }
    
    func choseOperation(is operation: String) {
        model.currentOperation = operation
    }
    
    func switchUserInput() -> Void {
        model.view = (userView + 1) % 3
    }
    
    func calculateTotal() -> Void {
        model.calculateTotal()
    }
    
}

struct LabelButton: View {
    let value: String
    let color: Color
    let viewModel: CalculatorViewModel
    
    var body: some View {
        Text(value)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width: 45, height: 45)
                .foregroundColor(.white)
                .padding(20)
                .background(color)
                .clipShape(Circle())
    }
}

struct rowOfValues: View {
    let values: [String]
    let colors: [Color]
    let viewModel: CalculatorViewModel
    let operations: [String] = ["+", "-", "X", "➗", "√"]
    
    var body: some View {
        HStack {
            ForEach(0..<values.count, id: \.self) { Index in
                Button {
                    print("Chose \(values[Index])")
                    if let _: Int = Int(values[Index]) {
                        appendValueToCurrent(appendValue: values[Index])
                    } else {
                        if values[Index] == "AC" {
                            clearCurrent()
                        } else if operations.contains(values[Index]) {
                            operation(is: values[Index])
                            viewModel.switchUserInput()
                        } else if values[Index] == "=" {
                            viewModel.calculateTotal()
                            viewModel.switchUserInput()
                        } else {
                            return
                        }
                    }
                } label: {
                    LabelButton(value: values[Index], color: colors[Index], viewModel: viewModel)
                }

            }
        }
    }
    
    private func appendValueToCurrent(appendValue: String) -> Void{
        viewModel.appendToCurrent(value: appendValue)
    }
    
    private func clearCurrent() -> Void {
        viewModel.clear()
    }
    
    private func operation(is userInput: String) -> Void {
        if userInput == "+" {
            viewModel.choseOperation(is: "+")
        } else if userInput == "-" {
            viewModel.choseOperation(is: "-")
        } else if userInput == "X" {
            viewModel.choseOperation(is: "X")
        } else if userInput == "➗" {
            viewModel.choseOperation(is: "➗")
        } else if userInput == "√" {
            viewModel.choseOperation(is: "√")
        }
    }
}

struct rowOfValues_preview: PreviewProvider {
    static var previews: some View {
        @State var viewModel = CalculatorViewModel()
        ZStack {
            Color.black.ignoresSafeArea()
            
            rowOfValues(values: ["1", "2", "3", "4"],
                        colors: [Color.gray, Color.gray, Color.gray, Color.gray],
                        viewModel: viewModel)
            
        }
    }
}
