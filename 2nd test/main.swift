import Foundation

func setterOf(date: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    guard let dateOf = formatter.date(from: date) else {
        return nil
    }
    return dateOf
}

struct Student {
    let firstName: String
    let lastName: String
    let dateOfBirth: Date?
    let dateOfEnrollment: Date?
    var subjects: [Subject] = []
    var grades: [Int] = []

    func getAverageGrade() -> Double {
        let totalGrades = grades.reduce(0, +)
        return Double(totalGrades) / Double(grades.count)
    }
}

struct Teacher {
    enum Title {
        case Bc, Ing, MUDr, Mgr, PhD, Prof, Doc, Dr, DiS, DocIng
    }
    let titleBeforeName: Title
    let firstName: String
    let lastName: String
    let titleAfterName: Title?
    let dateOfBirth: Date?
    var subjects: [Subject] = []

    func teaches(in year: Int, semester: Int) -> Int {
        // Count the number of subjects the teacher is teaching in the given academic year and semester
        return subjects.filter { $0.semester == semester && $0.year == year }.count
    }
}

struct Subject {
    let numberOfCredits: Int
    let semester: Int
    let year: Int
    let guarantor: Teacher
    let lecturesTeacher: [Teacher]
    let practiseTeacher: [Teacher]
    let prerequisites: [Subject]?
}

struct Exercise {
    let necessityOfOwnPC: Bool
    let groups: [Student]
    let teacher: Teacher
}

var me = Student(firstName: "Daniil",
                 lastName: "Krivonogov",
                 dateOfBirth: setterOf(date: "01/10/2001"),
                 dateOfEnrollment: setterOf(date: "01/09/2020"))

var marek = Student(firstName: "Marek",
                 lastName: "Novak",
                 dateOfBirth: setterOf(date: "12/04/2002"),
                 dateOfEnrollment: setterOf(date: "01/09/2021"))

var martin = Student(firstName: "Martin",
                 lastName: "Havel",
                 dateOfBirth: setterOf(date: "30/05/2000"),
                 dateOfEnrollment: setterOf(date: "01/09/2019"))


var panKral = Teacher(titleBeforeName: .Ing,
                       firstName: "Erik",
                       lastName: "Kral",
                       titleAfterName: .PhD,
                       dateOfBirth: setterOf(date: "25/06/1980"))

var paniMatusikova = Teacher(titleBeforeName: .Ing,
                             firstName: "Marcela",
                             lastName: "Matusikova",
                             titleAfterName: nil,
                             dateOfBirth: setterOf(date: "17/12/1992"))

var panKadavy = Teacher(titleBeforeName: .Ing,
                          firstName: "Tomas",
                          lastName: "Kadavy",
                          titleAfterName: nil,
                          dateOfBirth: setterOf(date: "12/02/1989"))

var panSenkerik = Teacher(titleBeforeName: .DocIng,
                          firstName: "Roman",
                          lastName: "Senkerik",
                          titleAfterName: .PhD,
                          dateOfBirth: setterOf(date: "12/02/1970"))

var AP1PA = Subject(numberOfCredits: 4,
                    semester: 1,
                    year: 1,
                    guarantor: panKral,
                    lecturesTeacher: [panKral],
                    practiseTeacher: [panKral, paniMatusikova],
                    prerequisites: nil)

var AP2OP = Subject(numberOfCredits: 4,
                    semester: 2, year: 1,
                    guarantor: panKral,
                    lecturesTeacher: [panKral],
                    practiseTeacher: [panKral, paniMatusikova],
                    prerequisites: [AP1PA])

var AP3AF = Subject(numberOfCredits: 4,
                    semester: 3,
                    year: 2,
                    guarantor: panKral,
                    lecturesTeacher: [panKral],
                    practiseTeacher: [panKral, paniMatusikova],
                    prerequisites: [AP1PA, AP2OP])

var AP3TI = Subject(numberOfCredits: 5,
                    semester: 3,
                    year: 2,
                    guarantor: panSenkerik,
                    lecturesTeacher: [panSenkerik],
                    practiseTeacher: [panKadavy],
                    prerequisites: nil)

var exercise1 = Exercise(necessityOfOwnPC: true,
                         groups: [me, martin],
                         teacher: panKral)

var exercise2 = Exercise(necessityOfOwnPC: false,
                         groups: [martin, marek],
                         teacher: panKadavy)

var exercise3 = Exercise(necessityOfOwnPC: true,
                         groups: [me, marek],
                         teacher: paniMatusikova)

me.subjects = [AP2OP, AP3TI]
me.grades = [AP2OP.numberOfCredits, AP3TI.numberOfCredits]
me.canDropOut() //output: false
me.getAverageGrade() //output: 4,5

marek.subjects = [AP1PA, AP3TI]
marek.grades = [AP1PA.numberOfCredits, AP3TI.numberOfCredits]

martin.subjects = [AP3AF, AP3TI]
martin.grades = [AP3AF.numberOfCredits, AP3TI.numberOfCredits]

panKral.subjects = [AP1PA, AP2OP, AP3AF]
panKral.teaches(in: 1, semester: 1) //output: 1
