//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Taylor Tran on 9/23/24.
//

import Foundation
import SwiftUI

struct CalculatorModel {
    var total: String = "0"
    var userInput: String = "0"
    
    var currentOperation: String = ""
    
    var userInput2: String = ""
    var view: Int = 0
    
    mutating func appendToCurrent(value: String) {
        if view == 0 {
            if userInput == "0" {
                userInput = value
            } else if userInput.count < 4{
                userInput += value
            } else {
                print("Too many numbers, max of 4")
            }
        } else if view == 1 {
            if userInput2 == "0" {
                userInput2 = value
            } else if userInput2.count < 4{
                userInput2 += value
            } else {
                print("Too many numbers, max of 4")
            }
        } else {
            print("You are seeing the total, press AC to restart")
        }
    }
    
    mutating func calculateTotal() -> Void {
        let operation: String = currentOperation
        
        if let first: Int = Int(userInput), let second: Int = Int(userInput2) {
            if operation == "+" {
                total = String(first + second)
            } else if operation == "-" {
                total = String(first - second)
            } else if operation == "X" {
                total = String(first * second)
            } else if operation == "➗" {
                total = String(first / second)
            }
        }
    }
    
    mutating func clear() -> Void {
        total = "0"
        userInput = "0"
        
        currentOperation = ""
        
        userInput2 = ""
        view = 0
    }
}
