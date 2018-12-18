//
//  Person.swift
//  exerciseEight(tableview)
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 student. All rights reserved.
//

import Foundation

class Person{
    //存储属性
    var name:String
    var age:Int = 0
    var gender:String
    var grade:Int = 0
    //构造函数
    init(name:String,age:Int,gen:String,grade:Int){
        self.name = name
        self.age = age
        self.gender = gen
        self.grade = grade
    }
}
class Teacher:Person{
    init(name:String,age:Int,gender:String,grade:Int){
        super.init(name:name,age:age,gen:gender,grade:grade)
    }
}
class Student:Person{
    init(name:String,age:Int,gender:String,grade:Int){
        super.init(name:name,age:age,gen:gender,grade:grade)
    }
    
}

