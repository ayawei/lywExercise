import UIKit

var array = [Int]()

for i in 2...10000{
    var isPrime = true
    for j in 2..<i{
        if i%j == 0{
            isPrime = false
        }
    }
    if isPrime {
        array.append(i)
    }
}

print("-----------------正输出-----------------")
print(array)
array.reverse()

print("-----------------firstMethod-----------------")
func compare(x:Int,y:Int)->Bool{
    return x>y
}
print(array)

print("-----------------secondMethod-----------------")
array.sort(by:{(x:Int,y:Int)->Bool in
    return x>y
})
print(array)

print("-----------------thirdMethod-----------------")
array.sort(by:{(x,y)in x>y})
print(array)

print("-----------------fourthMethod-----------------")
array.sort{$0>$1}
print(array)

print("-----------------fifthMethod-----------------")
array.sort(by:>)
print(array)

