//
//  All Extensions.swift
//  
//
//  Created by Thomas on 2/20/15.
//
//

import Foundation
import Cocoa

extension String {
    // Return a Character array of the string either preserving or removing whitespace
    func makeArray (preserveWhiteSpace: Bool = true) -> [Character] {
        let whitespace:[Character] = [" ", "\t", "\n", "\r"]
        var _chars: [Character] = []
        if preserveWhiteSpace {
            for i in self {
                _chars.append(i)
            }
        } else {
            for i in self {
                if contains(whitespace, i) {continue}
                _chars.append(i)
            }
        }
        
        
        return _chars
    }
    // Space out each character in a string by a given number of spaces
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
    // Return the String in the reverse order
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
    // Check is string is a palindrome either ignoring or counting Whitespace
    func isPalindrome (countSpaces:Bool = false) -> Bool {
        let Whitespace: [Character] = ["\n", "\r", " ", "\t"]
        var _string:String = ""
        if !countSpaces {
            for i in self {
                if contains(Whitespace, i) {
                    continue
                }
                _string += String(i)
            }
        } else {
            _string = self
        }
        if _string == _string.reverse() {
            return true
        } else {
            return false
        }
    }
    // Convert all letters in the String to lowercase (copied from Python)
    func toLower () -> String {
        var _string:String = ""
        let lowerLetterConstants:[Character:Character] = ["A":"a", "B":"b", "C":"c", "D":"d", "E":"e", "F":"f", "G":"g", "H":"h", "I":"i", "J":"j", "K":"k", "L":"l", "M":"m", "N":"n", "O":"o", "P":"p", "Q":"q", "R":"r", "S":"s", "T":"t", "U":"u", "V":"V", "W":"w", "X":"x", "Y":"y", "Z":"z"]
        for i in self {
            if contains(lowerLetterConstants.keys, i) {
                _string +=  String(lowerLetterConstants[i]!)
                continue
            }
            _string += String(i)
        }
        return _string
    }
    // Convert all letters in a string to uppercase (copied from Python)
    func toUpper() -> String {
        var _string:String = ""
        let upperLetterConstants:[Character:Character] = ["z":"Z", "y":"Y", "x":"X", "w":"W", "V":"V", "u":"U", "t":"T", "s":"S", "r":"R", "q":"Q", "p":"P", "o":"O", "n":"N", "m":"M", "l":"L", "k":"K", "j":"J", "i":"I", "h":"H", "g":"G", "f":"F", "e":"E", "d":"D", "c":"C", "b":"B", "a":"A"]
        for i in self {
            if contains(upperLetterConstants.keys, i) {
                _string += String(upperLetterConstants[i]!)
                continue
            }
            _string += String(i)
        }
        return _string
    }
    // Return a substring of the string from a given index (start at 0) to the end index
    func slice(start:Int, end:Int) -> String {
        var _stringArray:[Character] = []
        var _returnString:String = ""
        for i in self {
            _stringArray.append(i)
        }
        for (var i = start; i < end; i++) {
            _returnString += String(_stringArray[i])
        }
        return _returnString
    }
    // return the String in title case
    func toTitle () -> String {
        let upperLetterConstants:[Character:Character] = ["A":"a", "B":"b", "C":"c", "D":"d", "E":"e", "F":"f", "G":"g", "H":"h", "I":"i", "J":"j", "K":"k", "L":"l", "M":"m", "N":"n", "O":"o", "P":"p", "Q":"q", "R":"r", "S":"s", "T":"t", "U":"u", "V":"V", "W":"w", "X":"x", "Y":"y", "Z":"z"]
        var _newString2 = ""
        var j = 0
        for i in self {
            if j == 0 {
                _newString2 += String(i).toUpper()
                j++
                continue
            }
            if j != 0 && self.slice(j-1, end: j) == " " {
                j++
                continue
            }
            if i == " " {
                _newString2 = _newString2 + " " + self.slice(j+1, end: j+2).toUpper()
                j++
                continue
            }
            if contains(upperLetterConstants.keys, i) {
                _newString2 += String(i).toLower()
                j++
                continue
            }
            _newString2 += String(i)
            j++
        }
        return _newString2
    }
    // String length
    var length:Int {
        var c:Int = 0
        for i in self {
            c++
        }
        return c
    }
}

extension Array {
    // Return a single random item
    func randomItem () -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    // Get every other element from an array starting at a certain index
    func everyOther (start:Int=0) -> Array<T> {
        var _everyOther:Array = []
        for (var i = start; i < self.count; i+=2){
            _everyOther.append(self[i])
        }
        return _everyOther
    }
    // Get an item
    func getItem (item:Int=0) -> T {
        return self[item]
    }
    // Get all items between a start point and end point
    func xgetItems (end:Int, start:Int = 0) -> Array<T> {
        var _getItems:Array = []
        for (var i = start; i < end; i++) {
            _getItems.append(self[i])
        }
        return _getItems
    }
    // Get a certain quantity of items beginning at a start index
    func getItems (end:Int, start:Int = 0) -> Array<T> {
        var _getItems:Array = []
        for (var i = start; i < end+start; i++) {
            _getItems.append(self[i])
        }
        return _getItems
    }
}

extension Int {
    func isGreater(a:Int) -> Bool {
        return self > a
    }
    func isLesser(b:Int) -> Bool {
        return self < b
    }
    func isLesserGreater(greaterthan:Int, lessthan:Int) -> Bool {
        return (greaterthan < self) && (self < lessthan)
    }
    func isLeapYear() -> Bool {
        return self % 4 == 0 && (self % 100 != 0 || self % 400 == 0)
    }
}

extension Double {
    var to_i:Int {
        return Int(self)
    }
}

