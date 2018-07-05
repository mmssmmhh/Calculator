//
//  BrainCalculator.swift
//  Calculator
//
//  Created by Mohamed Kelany on 3/11/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class BrainCalculator {
    
    func Add(Number : Double , with Operation : Character ){
        NumWithOpArray.append(CalcElement(Num: Number , Op : Operation))
    }
    func Restart() {
        NumWithOpArray = []
    }
    
    func Result() -> String {
        CalculateMultiplyAndDividedBy()
        CalculateAllMinus()
        return String(NumWithOpArray.reduce(0, {$0 + $1.Num}))
    }
    
    typealias CalcElement = (Num : Double , Op : Character)
    private var NumWithOpArray : [CalcElement] = []
    
    
    func CalculateMultiplyAndDividedBy() {
        
        for (index , current) in NumWithOpArray.enumerated() {
            
            if current.Op == "x" || current.Op == "/" {
                let afterCurrent = NumWithOpArray[index + 1]
                var NewCalc : CalcElement!
                if current.Op == "x" {
                    NewCalc = CalcElement(Num: current.Num * afterCurrent.Num , Op : afterCurrent.Op)
                } else if current.Op == "/" {
                    NewCalc = CalcElement(Num: current.Num / afterCurrent.Num , Op : afterCurrent.Op)
                }
                NumWithOpArray.remove(at: index)
                NumWithOpArray.remove(at: index)
                NumWithOpArray.insert(NewCalc, at: index)
                CalculateMultiplyAndDividedBy()
                break
            }
        }
        
    }
    
    func CalculateAllMinus(){
        for (index , current) in NumWithOpArray.enumerated() {
            
            if current.Op == "-" {
                let afterCurrent = NumWithOpArray[index + 1]
                let NewCalc : CalcElement = CalcElement(Num: current.Num - afterCurrent.Num , Op : "+")
                NumWithOpArray.remove(at: index)
                NumWithOpArray.remove(at: index)
                NumWithOpArray.insert(NewCalc, at: index)
                CalculateAllMinus()
                break
            }
        }
    
    }
}
