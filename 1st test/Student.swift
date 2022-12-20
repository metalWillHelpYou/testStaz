struct UserData {
    var name: String
    var dateOfbirth: String
    var year: Int
    var subjects: [String]
}

var me = UserData(name: "Daniil Krivonogov", dateOfbirth: "1st October", year: 2, subjects: ["AP3OS", "AP3AF", "AP3TI"])
me.subjects.append("AP2AE") //adding a new subject
me.subjects //output: ["AP3OS", "AP3AF", "AP3TI", "AP2AE"]
me.subjects[1] //output: AP3AF
