import UIKit

//1
let now = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年M月d日 EEEE aa HH:mm"
dateFormatter.locale = Locale.current

dateFormatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
let London = dateFormatter.string(from: now)
print("London：\(London)")

dateFormatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let BeiJing = dateFormatter.string(from: now)
print("BeiJing：\(BeiJing)")

dateFormatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let Tokyo = dateFormatter.string(from: now)
print("Tokyo：\(Tokyo)")

dateFormatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let NewYork = dateFormatter.string(from: now)
print("NewYork：\(NewYork)")

//2
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let substr = str[str.index(str.startIndex,offsetBy: 6)..<str.index(str.startIndex, offsetBy: 21)]
print(substr)
str.removeSubrange(str.range(of: "OS")!)

//3
var dic = [["time":BeiJing,"string":str],["time":Tokyo,"string":str],["time":NewYork,"string":str],["time":London,"string":str]]as AnyObject
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
url.appendPathComponent("test.txt")
dic.write(toFile:url.path,atomically:true)
print(url.path)
let kk = NSDictionary(contentsOf: url)
print(kk as Any)

//4
Let imageUrl = URL(string:" https://www.tutorialspoint.com/codingground/images/cg_jquery.png")!
let imageData = try! Data(contentsOf: imageUrl)
let image = UIImage(data: imageData)
var imageLocalUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

imageLocalUrl.appendPathComponent("test.jpg")
try? imageData.write(to: imageLocalUrl)

