//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Khue on 15/12/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double?, calcMethod: String?)?
    
    mutating func setNumber(number: Double) {
        self.number = number
    }
    
    mutating func calculate(calcMethod: String) -> Double? {
        if let n = number {
            switch calcMethod {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoCalculation(n2: n)
            default:
                intermediateCalculation = (n, calcMethod)
            }
        }
        return nil
    }
    
    private mutating func performTwoCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let calcMethod = intermediateCalculation?.calcMethod {
            intermediateCalculation = (nil, nil)
            switch calcMethod {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The calcMethod doesn't match any of the cases")
            }
        }
        return n2
    }
}
