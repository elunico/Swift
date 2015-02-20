#!/usr/bin/xcrun swift
//  testing.swift
//  
//
//  Created by Thomas Povinelli on 2/17/15.
//
//

import Foundation

extension Array {
    func returnReverse() -> Array<T> {
        var newArray:Array = self
        for (var i = 0; i < self.count; i++) {
            newArray[(self.count - 1) - i] = self[i]
        }
        return newArray
    }
    func randomItem () -> T {
        let random = Int(arc4random_uniform(UInt32(self.count)))
        return self[random]
    }
    func everyOther (start:Int=0) -> Array<T> {
        var _everyOther:Array = []
        for (var i = start; i < self.count; i+=2){
            _everyOther.append(self[i])
        }
        return _everyOther
    }
    func getItem (item:Int=0) -> T {
        return self[item]
    }
    func xgetItems (end:Int, start:Int = 0) -> Array<T> {
        var _getItems:Array = []
        for (var i = start; i < end; i++) {
            _getItems.append(self[i])
        }
        return _getItems
    }
    func getItems (end:Int, start:Int = 0) -> Array<T> {
        var _getItems:Array = []
        for (var i = start; i < end+start; i++) {
            _getItems.append(self[i])
        }
        return _getItems
    }
}

extension String {
    func spaceOut (spaces:Int = 1) -> String {
        var _newString:String = ""
        var _space = ""
        for (var i = 0; i < spaces; i++){
            _space += " "
        }
        for i in self {
            _newString = _newString + String(i) + _space
        }
        return _newString
    }
    func reverse () -> String {
        var _chars:[Character] = []
        var _string:String = ""
        for i in self {
            _chars.append(i)
        }
        for (var i = _chars.count - 1; i >= 0; i--) {
            _string += String(_chars[i])
        }
        return _string
    }
}
/*
var words:[String] = ["one", "two", "three", "four"]
var numbers:[Int] = [1, 2, 3, 4, 5, 6, 7]
let days:[String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
var contestants = [[1, 2, 3, 4, 5], ["one", "two", "three", "four", "five"]]
var longList:[Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]

println(words.returnReverse().randomItem())
println(numbers.returnReverse().randomItem())
for (var i = 0; i < 7; i++) {
    println(days.randomItem())
}
println(contestants.returnReverse().randomItem().returnReverse().randomItem())

println(longList.xgetItems(10, start: 3))
println(longList.getItems(10, start:3))

var newList = longList.everyOther()
println(newList)
*/

println("Hello, World!".spaceOut(spaces: 3))
