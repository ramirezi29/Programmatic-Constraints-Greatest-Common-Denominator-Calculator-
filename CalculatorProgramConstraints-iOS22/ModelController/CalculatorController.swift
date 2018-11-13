//
//  CalculatorController.swift
//  CalculatorProgramConstraints-iOS22
//
//  Created by Ivan Ramirez on 11/12/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

class CalculatorController {
    
    static let shared = CalculatorController()
    
    func greatestCommonD(_ a: Int, _ b: Int) -> Int {
        
        // print("Start greatesCommonD \(a) - \(b)")
        if b == 0 {
            return a
        } else {
            if a > b {
                // print("A: \(a) - B:\(b)")
                return greatestCommonD(a - b, b)
            } else {
                //  print("B: \(b) - C: \(a)")
                return greatestCommonD(a, b - a)
            }
        }
    }
}
