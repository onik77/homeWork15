//
//  main.swift
//  homeWork15
//
//  Created by Onik Grigoryan on 24.06.22.
//

import Foundation

//1. Ստեղծել struct Point անունով որը պետք է ունենա 2 init `
//- պետք է սկզբնական արժեքներ տա x, y։ Օրինակ Point(x: 5, y: -8) -> x = 5, y = -8
//- պետք է միայն դրական սկզբնական արժեքներ տա   x, y-ին: Օրինակ Point(x: -5, y: -8) -> x = 5, y = 8


struct Point {
    var x: Double
    var y: Double

    init(pointX: Double , pointY: Double) {
        self.x = pointX
        self.y = pointY
    }
    init(pointX1:Double , pointY1: Double) {
        self.x = abs(pointX1)
        self.y = abs(pointY1)
    }
}
 let point = Point(pointX1: 5, pointY1: 8)
print(point)


//2. Ստեղծել struct Rect (հետևյալ փրոփրտիներով origin: Point, weight: Double, height: Double ) անունով որը պետք է ունենա հետևյալ init-ները`
//- init(origin: Point, weight: Double, height: Double)
//- init(center: Point, weight: Double, height: Double)
//- init(weight: Double, height: Double) -> Point.x = 0 Point.y = 0


struct Rect {
    var origin: Point
    var weight: Double
    var height: Double
    var center: Point

    init(origin: Point , weight: Double , height: Double) {
        self.origin = origin
        self.weight = weight
        self.height = height
        self.center = Point.init(pointX: origin.x + weight / 2, pointY: origin.y + height / 2)
    }
    init(center: Point , weight: Double , height: Double) {
        self.init(origin: Point(pointX: 1, pointY: 1), weight: weight, height: height)
    }
    init(weight: Double , height: Double) {
        self.init(origin: Point(pointX: 0, pointY: 0), weight: weight, height: height)
    }
}
let resultRect = Rect(origin: Point(pointX: 1, pointY: 1), weight: 10, height: 10)
print(resultRect.center)




//3. Ստեղծել struct Color (հետևյալ փրոփրտիներով red, green, blue)
//- init(red: Double, green: Double, blue: Double)
//- init(red: Double)
//- init(green: Double)
//- init(blue: Double)


struct Color {
    var red: Double
    var green: Double
    var blue: Double
    
    init(red:Double, green:Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(red: Double) {
        self.init(red: red, green: 0, blue: 0)
    }
    init(green: Double) {
        self.init(red: 0, green: green, blue: 0)
    }
    init(blue: Double) {
        self.init(red: 0, green: 0, blue: blue)
    }
}
let resultColor = Color(red: 1)
print(resultColor)


//4. Ստեղծել Class Car անունով (հետևյալ փրոփրտիներով name, model,speed, isAutomatic)  որը պետք է ունենա հետևյալ init-ները`
//- init(name: String, model: String, speed: String, isAutomatic: Bool)
//- init(name: String, model: String, speed: String)
//- init(name: String, model: String)
//- init(name: String)
//- init()

class Car {
    var name: String
    var model: String
    var speed: String
    var isAutomatic: Bool
    
    init(name:String , model:String , speed: String , isAutomatic: Bool) {
        self.name = name
        self.model = model
        self.speed = speed
        self.isAutomatic = isAutomatic
        
    }
    convenience init(name: String , model: String , speed: String) {
        self.init(name: name, model: model, speed: speed, isAutomatic: true)
    }
    convenience init(name: String , model: String) {
        self.init(name: name, model: model, speed: "225")
    }
    convenience init(name: String) {
        self.init(name: name, model: "C63")
    }
    convenience init() {
        self.init(name: "Mercedes")
    }
}

let resultInCar = Car(name: "BMW", model: "e60", speed: "211" , isAutomatic: true)
print("name -> \(resultInCar.name) -> model \(resultInCar.model) speed -> \(resultInCar.speed)")



//5. Ստեղծել Class View անունով (հետևյալ փրոփրտիներով frame: Rect, backgroundColor: Color, tag: Int)
//որը պետք է ունենա հետևյալ init-ները`
//- init(frame: Rect, backgroundColor: Color, tag: Int)
//- init(frame: Rect, backgroundColor: Color)
//- init(frame: Rect)
//- init()

class View {
    var frame: Rect
    var backgroundColor: Color
    var tag: Int

    init(frame: Rect , backgroundColor: Color , tag: Int) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.tag = tag
    }
    convenience init(frame: Rect , backgroundColor: Color) {
        self.init(frame: frame, backgroundColor: backgroundColor, tag: 1)
    }
    convenience init(frame: Rect) {
        self.init(frame: frame, backgroundColor: Color.init(red: 1))
    }
    convenience init() {
        self.init(frame: Rect.init(weight: 12, height: 33))
    }
}
let resultForView = View()
print(resultForView.backgroundColor)


//6. Ստեղծել Class Button որը կժառանգվի View -ից (հետևյալ փրոփրտիներով titleName: String, isSelected: Bool) որը պետք է ունենա հետևյալ init-ները`
//- init(frame: Rect, titleName: String, isSelected: Bool)
//- init(frame: Rect, titleName: String)

class Button: View {
    var titleName: String
    var isSelected : Bool
    
    init(frame: Rect , titleName: String , isSelected: Bool) {
        self.titleName = titleName
        self.isSelected = isSelected
        super.init(frame: frame, backgroundColor: Color(red: 1), tag: 0)
    }
   convenience init(frame: Rect , titleName: String) {
       self.init(frame: frame, titleName: titleName, isSelected: true)
    }
}
let resultForButton = Button(frame: Rect.init(origin: Point(pointX: 13, pointY: 10), weight: 7, height: 9), titleName: "Click")
print(resultForButton.frame.center)
