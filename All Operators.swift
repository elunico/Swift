//
//  All Operators.swift
//  
//
//  Created by Thomas on 3/6/15.
//
//

import Foundation
import Cocoa

//input function from Python
func input(message:String) -> String {
    println(message)
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
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

