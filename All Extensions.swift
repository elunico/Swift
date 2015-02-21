//
//  All Extensions.swift
//  
//
//  Created by Thomas Povinelli on 2/20/15.
//
//

import Foundation
import Cocoa

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
    var length:Int {
        var c:Int = 0
        for i in self {
            c++
        }
        return c
    }
}

extension Array {
    func randomItem () -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
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
