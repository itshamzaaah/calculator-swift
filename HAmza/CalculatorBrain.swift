//
//  CalculatorBrain.swift
//  Calculator//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Admin on 06/06/2023.
//

import Foundation
struct CalculaterBrain{
    private var accumulator:Double?
    enum Operation{
        case constant (Double)
        case unaryOperation((Double)->Double)
        case binaryOperation((Double,Double)->Double)
        case equals
        case clear
    }

    private var operations:Dictionary <String, Operation> = [
                "π" : .constant (Double.pi),
                "√" : .unaryOperation(sqrt),
                "cos" : .unaryOperation(cos),
                "sin" : .unaryOperation(sin),
                "tan" : .unaryOperation(tan),
                "sin⁻¹" : .unaryOperation(asin),
                "tan⁻¹" : .unaryOperation(atan),
                "cos⁻¹" : .unaryOperation(acos),
                "+" : .binaryOperation({$0 + $1}),
                "−" : .binaryOperation({$0 - $1}),
                "×" : .binaryOperation({$0 * $1}),
                "/" : .binaryOperation({$0 / $1}),
                "=" : .equals,
                "🆑" : .clear,
    ]
    mutating func performOperation(_ symbol:String){
        if let constant = operations[symbol]
        {
            switch constant{
                
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function ):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function ):
                if accumulator != nil {
                    pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case.equals:
                performPendingBinaryOperation()
            case.clear:
                accumulator = nil
                pbo = nil
            }
            
            
        }
    }
    
    private mutating func performPendingBinaryOperation()
    {
        if pbo != nil && accumulator != nil
        {
            accumulator = pbo!.perform(with: accumulator!)
        }
    }
    
    private var pbo : PendingBinaryOperation?
    
    private struct PendingBinaryOperation{
        var function: (Double, Double) -> Double
        var firstOperand: Double
        func perform (with secondoperand:Double) ->Double
        {
            return function(firstOperand, secondoperand)
        }
    }
    mutating func setOperand(_ operand:Double)
    {
        accumulator = operand
    }
    var result:Double?{
        get{
            return accumulator
        }
    }
}


