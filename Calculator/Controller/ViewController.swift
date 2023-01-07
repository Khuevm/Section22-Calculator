//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Variable
    private var calculatorLogic = CalculatorLogic()
    private var isFinishedTypingNumber: Bool = true
    private var num1 = 0
    private var isInt = true
    private var displayValue: Double {
        get {
            if let number = Double(displayLabel.text!) {
                return number
            } else {
                return 0
            }
        }
        
        set {
            let decimals = String(newValue).split(separator: ".")[1]
            if decimals.count <= 4 {
                displayLabel.text = String(newValue)
            } else {
                displayLabel.text = String(format: "%.4f", newValue)
            }
        }
    }
    
    // MARK: - IBAction
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        isInt = true
        
        calculatorLogic.setNumber(number: displayValue)
        if let result = calculatorLogic.calculate(calcMethod: sender.currentTitle!) {
            displayValue = result
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        let numValue = sender.currentTitle!
        
        if numValue == "." {
            if isInt {
                isInt = false
            }
            else {
                return
            }
        }
        
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else {
            let currentNum = displayLabel.text!
            displayLabel.text = currentNum + numValue
        }
    }

}

