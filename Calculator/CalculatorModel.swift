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
            } else if userInput.count < 9{
                userInput += value
            } else {
                print("Too many numbers, max of 9")
            }
        } else if view == 1 {
            if userInput2 == "0" {
                userInput2 = value
            } else if userInput2.count < 9{
                userInput2 += value
            } else {
                print("Too many numbers, max of 9")
            }
        } else {
            print("You are seeing the total, press AC to restart")
        }
    }
    
    mutating func calculateTotal() -> Void {
        let operation: String = currentOperation
        var numTotal: Double = 0
        
        if let first = Double(userInput), let second = Double(userInput2) {
            if operation == "+" {
                numTotal = (first + second)
            } else if operation == "-" {
                numTotal = (first - second)
            } else if operation == "X" {
                numTotal = (first * second)
            } else if operation == "➗" {
                numTotal = (first / second)
            }
        }
        
        if numTotal.truncatingRemainder(dividingBy: 1) == 0 {
            if String(Int(numTotal)).count > 10 {
                if let firstDigit = String(Int(numTotal)).first {
                    let exponent = String(Int(numTotal)).count - 1
                    total = "\(firstDigit)e\(exponent)"
                }
            } else {
                total = String(Int(numTotal))
            }
            
        } else {
            total = String(numTotal)
        }
        
        
        
    }
    
    mutating func clear() -> Void {
        total = "0"
        userInput = "0"
        
        currentOperation = ""
        
        userInput2 = ""
        view = 0
    }
    
    mutating func root(view: Int) -> Void {
        if view == 0 {
            if let double = Double(userInput) {
                if sqrt(double).truncatingRemainder(dividingBy: 1) == 0 {
                    userInput = String(Int(sqrt(double)))
                } else {
                    userInput = String(format: "%.5f", sqrt(double))
                }
            }
        } else if view == 1 {
            if let double = Double(userInput2) {
                if sqrt(double).truncatingRemainder(dividingBy: 1) == 0 {
                    userInput2 = String(Int(sqrt(double)))
                } else {
                    userInput2 = String(format: "%.5f", sqrt(double))
                }
            }
        }
    }
    
}
