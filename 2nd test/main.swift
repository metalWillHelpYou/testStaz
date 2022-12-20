import Foundation
import UIkit

func setterOf(date: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    guard let dateOf = formatter.date(from: date) else {
        return nil
    }
    return dateOf
}

class Student {
    var name: String
    var lastName: String
    var dayOfBirth: Date?
    var dateOfRegestration: Date?
    
    init(name: String, lastName: String, dayOfBirth: Date?, dateOfRegestration: Date?) {
        self.name = name.capitalized
        self.lastName = lastName.capitalized
        self.dayOfBirth = dayOfBirth
        self.dateOfRegestration = dateOfRegestration
    }
}

class Teacher: Student {
    enum Title {
        case Bc, Ing, MUDr, Mgr, PhD, Prof, Doc, Dr, DiS
    }
    
    var titleBeforeName: Title
    var titleAfterName: Title
    
    init(titleBeforeName: Title, name: String, lastName: String, titleAfterName: Title,
         dateOfBirth: Date?, dateOfRegestration: Date?) {
        self.titleBeforeName = titleBeforeName
        self.titleAfterName = titleAfterName
        super.init(name: name, lastName: lastName, dayOfBirth:
                    dateOfBirth, dateOfRegestration: dateOfRegestration)
    }
}

class Subject {
    enum Numbers {
        case First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth, Ninth, Tenth
    }
    var creditsAmount: Int
    var semestr: Numbers
    
    init(creditsAmount: Int, semestr: Numbers) {
        self.creditsAmount = creditsAmount
        self.semestr = semestr
    }
}

class Exercise {
    var pcWithMe: Bool
    
    init(pcWithMe: Bool) {
        self.pcWithMe = pcWithMe
    }
}
