//
//  All Operators.swift
//  
//
//  Created by Thomas on 3/6/15.
//
//

import Foundation
import Cocoa

//gets always returns a string
func gets() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = String(data: inputData, encoding: NSUTF8StringEncoding)
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

//input function from Python
func input(message:String) -> String? {
    print(message)
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = String(data: inputData, encoding: NSUTF8StringEncoding)
    let final = strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    if final == "" {
        return nil
    } else {
        return final
    }
}

/**************************************************************/

// AND operator that returns Ints not Bools
infix operator &&& {}

func &&& (l:Bool, r:Bool) -> Int {
    if (l && r) {
        return 1
    } else {
        return 0
    }
}

/**************************************************************/

// OR operator that returns Ints not Bools
infix operator ||| {}

func ||| (l: Bool, r:Bool) -> Int {
    if (l || r) {
        return 1
    } else {
        return 0
    }
}

/**************************************************************/

// exponentiation operator
infix operator ** { associativity left precedence 170 }

func ** (x:Double, y:Double) -> Double {
    return pow(x, y)
}

/**************************************************************/

// factorial operator
postfix operator *! {}

postfix func *! (num:Int) -> Int {
    if num <= 1 {
        return 1
    }
    else {
        return num * (num-1)*!
    }
}

/**************************************************************/

// Logical xor
infix operator ^^ {}

func ^^ (l:Bool, r:Bool) -> Bool {
    if (l || r) && (!(l && r)) {
        return true
    }
    return false
}

