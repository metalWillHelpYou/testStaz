var student = {
    "name": "Daniil Krivonogov",
    "dayOfbirth": "1st October",
    "year": 2,
    "subjects": [
        "AP3OS",
        "AP3AF",
        "AP3TI"
    ]
}

student.subjects.push("AP2AE") //adding a new subject
console.log(student.subjects) //output: ["AP3OS", "AP3AF", "AP3TI", "AP2AE"]
console.log(student.subjects[1]) //output: AP3AF
