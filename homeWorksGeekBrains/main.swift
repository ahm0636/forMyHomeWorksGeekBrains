//
//  main.swift
//  homeWorksGeekBrains
//
//  Created by Aurelica Apps iOS Dev - 1 on 17/02/22.
//

import Foundation

print("Hello, World!")


enum windowsState {
    case open
    case closed
}

enum luggage {
    case trunkIsFull
    case trunkIsEmpty
}




protocol CarCharacteristics {
    var weight: Int {get set}
    var color: String {get set}
    var breakSystem: String {get set}
    var teerSize: Int {get set}
    var engineCapacity: String {get set}
    var maxSpeed: Int {get set}
    var fuel: Int {get set}
}



protocol SpeedChangeble: CarCharacteristics {
    mutating func changeSpeed()
}



enum onOffSwitchTurbo {

    case off, on
    mutating func changeSpeed() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

protocol ArrayOfSpeed: CarCharacteristics {
    var speedRange: Int { get }
}

extension ArrayOfSpeed {

    func checkForSuperCar(km: SpeedChangeble) -> String {
        if speedRange > 260 {
            return ("Данный автомобиль имеет скорость\(speedRange) и это суперкар")
        }
        else {
            return ("попробуйте модифицировать Ваш автомобиль, Вам не хватает всего \(260 - speedRange)")
        }
    }
}




class FirstCar: ArrayOfSpeed {
    var speedRange: Int
    var cost: Int

    var weight: Int

    var color: String

    var breakSystem: String

    var teerSize: Int

    var engineCapacity: String

    var maxSpeed: Int

    var fuel: Int

    init(weight: Int,
         color: String,
         breakSystem: String,
         teerSize: Int,
         engineCapacity: String,
         maxSpeed: Int,
         fuel: Int,
         cost: Int,
         speedRange: Int)
    {
        self.breakSystem = breakSystem
        self.weight = weight
        self.fuel = fuel
        self.engineCapacity = engineCapacity
        self.maxSpeed = maxSpeed
        self.teerSize = teerSize
        self.color = color
        self.cost = cost
        self.speedRange = speedRange
    }


}




class SecondCar: FirstCar {
    var isElectric: Bool

    var isHybrid: Bool

    init(isElectric: Bool, isHybrid: Bool) {

        self.isHybrid = isHybrid
        self.isElectric = isElectric
         super.init(weight: 1000, color: "red", breakSystem: "carbon", teerSize: 22, engineCapacity: "V8", maxSpeed: 260, fuel: 80, cost: 10000, speedRange: 100)
    }
}


var mySecondCar = SecondCar(isElectric: true, isHybrid: true)

print("this car is \(mySecondCar.isElectric), teer size - \(mySecondCar), maximum speed - \(mySecondCar.maxSpeed)")

protocol Brand: CarCharacteristics {
    var brandName: String {get set}
}



enum nitroOnOffSwitch {
    case on
    case off
}


class SuperCar: Brand {

    var brandName: String

    var weight: Int

    var color: String

    var breakSystem: String

    var teerSize: Int

    var engineCapacity: String

    var maxSpeed: Int

    var fuel: Int

    var nitro: nitroOnOffSwitch

    init(brandName: String,
         weight: Int,
         color: String,
         breakSystem: String,
         teerSize: Int,
         engineCapacity: String,
         maxSpeed: Int,
         fuel: Int,
         nitro: nitroOnOffSwitch
    ) {
        self.teerSize = teerSize
        self.maxSpeed = maxSpeed
        self.breakSystem = breakSystem
        self.color = color
        self.weight = weight
        self.fuel = fuel
        self.brandName = brandName
        self.engineCapacity = engineCapacity
        self.nitro = nitro
    }

}

class HyperCar: FirstCar, CustomStringConvertible{
    var nitro: nitroOnOffSwitch = .on
    var description: String {
        return " this car has nitro \(nitro)"
    }
}
var myHyperCar = HyperCar(weight: 0, color: "",
                          breakSystem: "", teerSize: 0,
                          engineCapacity: "", maxSpeed: 0,
                          fuel: 0, cost: 0, speedRange: 0)

print("\(myHyperCar.description)")



var myThirdCar = SuperCar(brandName: "BMW M5", weight: 1900, color: "black", breakSystem: "carbon", teerSize: 22, engineCapacity: "V8", maxSpeed: 330, fuel: 100, nitro: .on)

print("""
this \(myThirdCar.brandName)
is \(myThirdCar.color) and has
\(myThirdCar.engineCapacity) engine,
break system - \(myThirdCar.breakSystem)
teerSize - \(myThirdCar.teerSize),
maxximum speed - \(myThirdCar.maxSpeed),
\(String(describing: ArrayOfSpeed.checkForSuperCar))
""")


struct queue<T> {

    // создание пустого массива
    private var myElements: [T] = []


    // проверка на наличие символа в коллекции
    var isEmpty: Bool {
        return myElements.count == 0
    }

    mutating func enqueue(element: T) {
        myElements.append(element)
    }
    mutating func dequeue()->T {
        return myElements.removeLast()
    }

    public var checkingForEmpty: T? {
        if isEmpty {
            print("Empty array")
            return nil
        } else {
            print("well done")
            return (myElements as! T)
        }
    }


}

struct User {
    var name: String!
    var age: Int!
    var hasCar: Bool!
    var cars: [String]!
}

var users: [User] = []
users.append(User(name: "Vasiliy", age: 23, hasCar: true, cars: ["Tesla", "Chayka", "Escalade"]))
users.append(User(name: "Andrey", age: 34, hasCar: true, cars:["Urus"]))
users.append(User(name: "Edem", age: 16, hasCar: true, cars:["Audi", "Chevrolet"]))


//extension Array {
//    func indexExists(_ index: Int) -> Bool {
//      return self.indices.contains(index)
//    }
//}

let carArray = ["Urus", "Escalade"]
let capitalizedBrands = carArray.map { $0.capitalized }


users = users.filter { $0.cars.contains(carArray[0]) || $0.cars.contains(carArray[1])}


users = users.filter { $0.cars.contains(where: { carArray.contains($0) }) }

print(users)

extension User: CustomStringConvertible {
    var description : String {
        return "Name: \(String(describing: name)) has a : \(String(describing: cars ?? nil))"
    }

}
