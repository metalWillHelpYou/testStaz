import Foundation
import UIkit

//Basic data types / variables
var var1: Int = 20 //create variables of different data types
var var2: Double
var var3: Bool
var var4: String

let str1 = "hello"
let str2 = " world"
var str3 = str1 + str2 //joining two strings
//output: hello world

var value1: Int //declaration
value1 = 15 //initialization

//Conditions
if value1 > 20 { //if / else
    value1 += 10
} else {
    value1 -= 10
}
//output: 5

switch value1 { //switch
case 5: print(5)
case 10: print(10)
case 15: print(15)
case 20: print(20)
default: break
}
//output: 5

for _ in 1...10 { //for - in
    print(value1)
}
//output: 5 5 5 5 5 5 5 5 5 5

var1 <= value1 ? print("var1 is less than or equal to value1") : print("var1 is greater than value1") //ternary operator
//output: var1 is greater than value1

//Cycles
let myMusic = ["metal", "rock", "jazz"] //for - in
for (index, musicName) in myMusic.enumerated(){
    print("\(index + 1). I like \(musicName)")
}
//output: ("I like metal", "I like rock", "I like jazz)

while var1 < 30 { //while
    var1 += 1
}
print(var1)
//output: 30

repeat { //repeat - while
    value1 -= 1
} while value1 <= 1
print(value1)
//output: 4

//Array
var shoppingList = ["eggs" ,"milk" ,"bread" ,"sweets"]
shoppingList.count //number of array elements
shoppingList.isEmpty //checking array for elements
shoppingList.append("butter") // adding an element to array
shoppingList[0] //output an array element at a given index
shoppingList[1] = "salt" //assigning a new value to array element at a given index
shoppingList.insert("sugar", at: 2) //adding a new array element at a given index
shoppingList += ["pepper"] //adding a new array element

for item in shoppingList { //printing out all elements of array
    print(item)
}
    
for (index, value) in shoppingList.enumerated() { //printing out all elements of array in tuple
    print("Item \(index) is \(value)")
}

let board = Array(repeating: Array(repeating: 0, count: 8), count: 8) //two-dimensional array
board[0][0] //access to individual values
board.forEach({ print($0) })

//Functions
func printWholeName(firstName: String, secondName: String) {
        print(firstName.capitalized + " " + secondName.capitalized)
    }
printWholeName(firstName: "daNiLl", secondName: "KrIVOnoGov")
//output: Danill Krivonogov

func getCodeDescription(code: Int) -> (code : Int, description: String) {
    let description: String
    switch code {
    case  1...100 : description = "error"
    case 101...200: description = "correct"
    default: description = "unknown"
    }
    return (code, description)
}
getCodeDescription(code: 404)
//output: (code 404, description "unknown")

func generateWallet(walletLeignt: Int) -> [Int] {
    let typeOFBanknots = [100, 200, 500, 1000, 2000, 5000]
    var wallet = [Int]()
    for _ in 1...walletLeignt {
        wallet.append(typeOFBanknots.randomElement()!)
    }
    return wallet
}
generateWallet(walletLeignt: 5)

func sumWallet(banknotesFunction wallet: (Int) -> [Int], walletLength: Int) -> Int? {
    let myWallet = wallet(walletLength)
    var sum = 0
    for bancnote in myWallet {
        sum += bancnote
    }
    return sum
}
sumWallet(banknotesFunction: generateWallet(walletLeignt:), walletLength: 5)

//OOP
class Teacher {
    var titul = ""
    var name = ""
    var lastName = ""
    var dayOfBirth = 1
}

class Student {
    var name = ""
    var lastName = ""
    var dayOfBirth = 1
    var registrationData: Int?
}

let teacher = Teacher()
let student = Student()

//OOP 2
func set(date: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    guard let dateOfBirth = formatter.date(from: date) else {
        return nil
    }
    return dateOfBirth
}

class Human {
    var name: String
    var lastName: String
    var fullName: String {
        name + " " + lastName
    }
    var dateOfBirth: Date?
    
    func sayHello() {
        print("Hello, my name is " + fullName)
    }
    
    init(name: String, lastName: String, dateOfBirth: Date?) {
        self.name = name.capitalized
        self.lastName = lastName.capitalized
        self.dateOfBirth = dateOfBirth
    }
}

class NewStudent: Human {
    var dateOfRegestration: Date?
    
     init(name: String, lastName: String, dateOfBirth: Date?, dateOfRegestration: Date?) {
        self.dateOfRegestration = dateOfRegestration
         super.init(name: name, lastName: lastName, dateOfBirth: dateOfBirth)
    }
}

class NewTeacher: NewStudent {
    var titleBeforeName: String
    var titleAfterName: String? {
        get {
            if self.titleAfterName == nil {
                return ""
            } else {
                titleAfterNameUnwrapped = self.titleAfterName!
                return titleAfterNameUnwrapped
            }
        }
        set {
            titleAfterNameUnwrapped = newValue! ?? ""
        }
    }
    private var titleAfterNameUnwrapped = ""
    override var fullName: String {
        titleBeforeName + " " + name + " " + lastName + " " + titleAfterNameUnwrapped
    }
    
    init(titleBeforeName: String, name: String, lastName: String, titleAfterName: String?, dateOfBirth: Date?, dateOfRegestration: Date?) {
        self.titleBeforeName = titleBeforeName
        super.init(name: name, lastName: lastName, dateOfBirth:
                    dateOfBirth, dateOfRegestration: dateOfRegestration)
    }
}

let me = NewStudent(name: "daniil", lastName: "krivonogov", dateOfBirth: set(date: "01/10/2001"), dateOfRegestration: set(date: "04/08/2021"))

let newTeacher = NewTeacher(titleBeforeName: "Ing.", name: "Gabriela", lastName: "Vr??nov??", titleAfterName: nil, 
                            dateOfBirth: set(date: "05/09/1986"), dateOfRegestration: set(date: "13/08/2018"))

var classroom = [me, newTeacher] //example of polymorphism
for i in classroom {
    print(i.sayHello())
}
