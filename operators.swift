#!/usr/bin/xcrun swift
// Created by Thomas

import Cocoa // needed for the power operator
import Foundation // needed for the input function

//input function from Python
func input(message:String) -> String {
    println(message)
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
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

var x:String
println(10*!)
println(2**10)
x = input("Please enter your name: ")
println(x);