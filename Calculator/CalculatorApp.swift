//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Taylor Tran on 9/23/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView(viewModel: CalculatorViewModel())
        }
    }
}
