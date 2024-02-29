//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 24/05/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func PerformOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
                           brain.setOperand(displayValue)
                           userIsInTheMiddleOfTyping = false
                       }
                       if let mathematicalSymbol = sender.currentTitle{
                           brain.performOperation(mathematicalSymbol)
                       }
                       if let result = brain.result{
                           displayValue = result
                       }
            }
    private var brain = CalculaterBrain()
    var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set (myNewValue){
            display.text = String(myNewValue)
        }
    }
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping: Bool = false
    
    

    
    @IBAction func TouchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print ("\(digit) was called")
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else
        {display.text = digit
            userIsInTheMiddleOfTyping = true
            
        }
        
       
    }
    
    
    @IBAction func touchdecimalbutton(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
                let textCurrentlyInDisplay = display.text!
                // Check if the current value already contains a decimal point
                if !textCurrentlyInDisplay.contains(".") {
                    display.text = textCurrentlyInDisplay + "."
                }
            } else {
                display.text = "0."
                userIsInTheMiddleOfTyping = true
            }
    }
    
    
    
    
    
    @IBAction func touchClear(_ sender: UIButton) {
        displayValue = 0
        userIsInTheMiddleOfTyping = false
        brain.performOperation("🆑")
    }
     
    
  
    


}

