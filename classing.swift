#!/usr/bin/xcrun swift
//  Created by Thomas Povinelli on 2/17/15.

import Foundation
import Cocoa

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
}

func + (x:Person, y:Person) -> Person {
    let genders = ["male", "female"]
    let randomNumber = Int(arc4random_uniform(UInt32(400)))
    var z:Person = Person()
    z.name = x.name! + y.name!
    z.age = Int(Double(x.age + y.age) * 0.15)
    z.height = (x.height! + y.height!) * 0.47
    z.weight = (x.weight! + y.weight!) * 0.43
    z.gender = genders.randomItem()
    z.credit = 700
    z.debt = x.debt + y.debt
    z.happiness = Int( Double(x.happiness + y.happiness) / 1.15 )
    if randomNumber == 1 {
        z.health = Int( Double(x.health + y.health) * 0.3 )
    } else {
        z.health = Int( Double(x.health + y.health) * 0.9 )
    }
    z.money = 100
    z.employed = ""
    z.salary = 0
    z.isComplex = false
    return z
}

infix operator ** {associativity left precedence 170}

func ** (x:Double, y:Double) -> Double {
    return pow(x, y)
}

class Person {
    var name:String? = nil
    var height:Double? = nil
    var weight:Double? = nil
    let kind:String = "human"
    var health:Int = 100
    var money:Double = 1000
    var age:Int = 18
    var debt:Double = 0
    var credit:Int = 700
    var gender:String = ""
    var employed:String = ""
    var salary:Double = 0
    var happiness:Int = 100
    var isComplex = false
    func setHeight (height:Double) {
        self.height = height
    }
    func setWeight (weight:Double) {
        self.weight = weight
    }
    func setGender (gender:String) {
        self.gender = gender
    }
    func getGender () -> String {
        return gender
    }
    func makeComplex () {
        isComplex = true
    }
    func getFired () {
        if (happiness < 40) {
            salary = 200
            employed = ""
            happiness -= 25
        }
    }
    func getJob (job:String, salary:Double) {
        employed = job
        self.salary = salary
        happiness -= 10
    }
    func retire () {
        salary = -12000
        employed = "Retiree"
        money -= debt
        health -= 10
        happiness += 25
    }
    func getSalary () {
        money += salary
        happiness += 2
    }
    func isEmployed () -> Bool {
        if employed != "" {
            return true
        }
        else {
            return false
        }
    }
    func inDebt () -> Bool {
        if debt > 0 {
            return true
        }
        else {
            return false
        }
    }
    func canBorrow () -> Bool {
        if credit > 450 && kind == "human" {
            return true
        }
        else {
            return false
        }
    }
    func borrowMoney (amount:Int) -> Bool {
        var limit:Int
        if ( credit < 450 || kind != "human" ) {
            println("Cannot Borrow. Credit Rejected")
            return false
        }
        limit = 5000
        if ( credit > 670 ) {
            limit = 10000
        }
        if (amount <= limit) {
            debt += Double(amount)
        }
        else {
            println("You were denied your loan")
        }
        return true
    }
    func payLoan (amount: Int) {
        self.debt -= Double(amount)
    }
    func interestGain () {
        var grossSalary:Double
        debt *= 1.045
        if debt > 1000 {
            credit -= 20
            grossSalary = salary
            salary -= 100
            salary = grossSalary
        }
        else if debt > 1000 {
            credit -= 40
            grossSalary = salary
            salary -= 120
            salary = grossSalary
        }
        else if debt > 1000 {
            credit -= 65
            grossSalary = salary
            salary -= 150
            salary = grossSalary
        }
        else if ( debt <= 0 && credit < 796 ) {
            credit += 5
        }
    }
    func getKind () -> String {
        return self.kind
    }
    func setName (name:String) {
        self.name = name
    }
    func getName () -> String? {
        return self.name
    }
    func die (thing:Person) {
        println("\(thing.name!) has died")
    }
    func isAlive () -> Bool {
        if health > 0 {
            return true
        }
        else {
            return false
        }
    }
    func agen () {
        age++
        interestGain()
        getSalary()
        if age == 18 {
            println("Get out of my house!")
        }
        if age == 35 {
            println("*Cries*")
            happiness -= 15
            getFired()
        }
        if age == 65 {
            println("Retirement!")
            happiness += 10
            retire()
        }
        if age == 80 {
            health = 0
            die(self)
        }
        println("\nYou are now \(age) years old.")
        if isEmployed() {
            println("You have a job as a \(employed) and make \(salary) annually")
        }
        println("You have \(money) dollars")
        println("Health: \(health)\n")
        if health == 0 {
            println("You are dead\n")
        }
    }
    func hasName () -> Bool {
        if name != nil && name != "" {
            return true
        }
        else {
            return false
        }
    }
    func attack (thing:Person) {
        thing.health -= 10
        if !thing.isAlive() {
            thing.die(thing)
        }
    }
    func removeComplex () {
        isComplex = false
    }
}

var tom, nick:Person
var i:Int
tom = Person()
nick = Person()
tom.setHeight(68.5)
nick.setHeight(66.5)
tom.setWeight(135)
nick.setWeight(129)
tom.setName("Tom")
nick.setName("Nick")
nick.health = 10
tom.attack(nick)
tom.getJob("Programmer", salary: 230000)
nick.getJob("Actor", salary: 1400000)
tom.borrowMoney(6500)
tom.agen()
tom.agen()
tom.agen()
nick.agen()
nick.agen()
tom.payLoan(7000)
i = 0/*
while (i < 60) {
    tom.agen()
    nick.agen()
    i++
}*/
var jimmy:Person = tom + nick
println(jimmy.getName()!)
println(jimmy.getSalary())
println(jimmy.salary)
println(jimmy.happiness)
println(jimmy.debt)
println(jimmy.isAlive())