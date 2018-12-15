import UIKit

enum Gender:Int{
    case male
    case female
}

enum Department {
    case buildingOne
    case buildingTwo
    case buildingThree
}

protocol SchoolProtocol{
    var department:Department{get}
    mutating func lendBook()
}

class Person: CustomStringConvertible {
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+" "+lastName
        }
    }
    
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(firstName:String){
        self.init(firstName:firstName,lastName:"",age:22,gender:Gender.female)
    }
    
    required convenience init() {
        self.init(firstName: "")
    }
    
    static func ==(leftitem: Person, rightitem: Person) -> Bool {
        return leftitem.fullName == rightitem.fullName && leftitem.age == rightitem.age && leftitem.gender == rightitem.gender
    }
    
    static func !=(leftitem: Person, rightitem: Person) -> Bool {
        return !(leftitem == rightitem)
    }
    
    var description:String{
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    
    func run() {
        print("Person \(self.fullName) is running")
    }
}

class Teacher:Person,SchoolProtocol{
    var title:String
    var department: Department
    
    init(firstName:String,lastName:String,age:Int,gender:Gender,title:String,department: Department){
        self.title = title
        self.department = department
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    
    convenience init(title:String){
        self.init(firstName:"",lastName:"",age:0,gender:Gender.female,title:title,department: Department.buildingOne)
    }
    
    convenience required init() {
        self.init(title: "")
    }
    
    override var description: String {
        return "title: \(self.title), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

class Student:Person,SchoolProtocol{
    var stuNo:Int
    var department: Department
    
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:Int,department: Department){
        self.stuNo = stuNo
        self.department = department
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    
    convenience init(stuNo:Int){
        self.init(firstName:"",lastName:"",age:0,gender:Gender.female,stuNo:stuNo,department: Department.buildingTwo)
    }
    
    convenience required init() {
        self.init(stuNo: 6)
    }
    
    override var description: String {
        return "title: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    override func run() {
        print("Student \(self.fullName) is running")
    }
    
    func lendBook() {
        print("Student \(self.fullName) lend a book")
    }
}

print("------------==and!=------------")
var p1 = Person(firstName: "Liu")
var p2 = Person(firstName: "Liu",lastName:"la", age: 20, gender: .male)
print(p1)
print(p1 == p2)
print(p1 != p2)

var array = [Person]()

for i in 1...3{
    let tempPerson = Person(firstName:"Liu",lastName:"\(i)",age:18,gender:.female)
    array.append(tempPerson)
}

for i in 1...3{
    let tempTeacher = Teacher(firstName:"Li",lastName:"\(i)",age:19,gender:.male,title:"Hello Student",department:.buildingOne)
    array.append(tempTeacher)
}

for i in 1...3{
    let tempStudent = Student(firstName:"Min",lastName:"\(i)",age:20,gender:.female,stuNo:2016110400+i,department:.buildingTwo)
    array.append(tempStudent)
}


var dict = ["Person": 0, "Teacher": 0, "Student": 0]

for item in array {
    if item is Teacher {
        dict["Teacher"]! += 1
    } else if item is Student {
        dict["Student"]! += 1
    } else {  //Person类
        dict["Person"]! += 1
    }
}

print("-----------dictionary------------")
for (key, value) in dict {
    print("\(key) has \(value) items")
}

print("---------------age---------------")
array.sort { return $0.age > $1.age}
for item in array {
    print(item)
}

print("------------fullname-------------")
array.sort { return $0.fullName < $1.fullName}
for item in array {
    print(item)
}

/*
 print("------------------------------")
 array.sort { return ($0.gender > $1.gender) && ($0.age > $1.age) }
 for item in array {
 print(item)
 }
 */

//穷举,调用run方法和lendBook方法
print("---------------穷举---------------")
for item in array {
    item.run()
    if let teacher = item as? Teacher {
        teacher.lendBook()
    }
    else if let student = item as? Student {
        student.lendBook()
    }
}

