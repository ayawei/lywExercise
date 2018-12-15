import UIKit

//1
let dicArray = [["name":"asd","age":"0"],["name":"fgh","age":"1"]]
let ageArray = dicArray.flatMap{$0["age"]}
print(ageArray)

let stringArray = ["123", "Swift", "HTML", "CSS", "JavaScript"]

//2
let numArray = stringArray.filter{Int($0) != nil}
print(numArray)

//3
func appendString(string1: String, string2: String) -> String {
    return string1 == "" ? string2 : string1 + "、" + string2
}
print(stringArray.reduce("", appendString))
/*
 stringArray.reduce("", {(string1, string2) -> String in
 return string1 == "" ? string2 : string1 + "、" + string2
 })
 
 // $0表示计算后的结果, $1表示数组中的每一个元素
 stringArray.reduce("", {
 return $0 == "" ? $1 : $0 + "、" + $1
 })
 */
//4
let numbersArray = [10,29,38,47,56,41,21,0,10]
let tempNumber = numbersArray.reduce((max:Int.min,min:Int.max,sum:0)){(tempNumber,i) in
    return(max(tempNumber.min,i),min(tempNumber.max,i),tempNumber.sum+i)
}

//6.扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证
extension Int{
    func sqrt(number:Int)->Double{
        return Darwin.sqrt(Double(number))
    }
}
print(sqrt(64.0))


//7.实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值
//，分别传入整数值、浮点数值、字符串进行验证
func findMaxMin<T:Comparable>(array:[T])->(max:T,min:T){
    var max = array[0]
    var min = array[0]
    
    for index in array{
        if max<index{
            max = index
        }else if min>index{
            min = index
        }
    }
    return (max,min)
}

let intArray = findMaxMin(array:[1,2,3,4])
print("max:\(intArray.max) min:\(intArray.min)")

let floatArray = findMaxMin(array:[1.0,2.0,3.0,4.0])
print("max:\(floatArray.max) min:\(floatArray.min)")

let stringArray = findMaxMin(array:["A","B","C","D"])
print("max:\(stringArray.max) min:\(stringArray.min)")

