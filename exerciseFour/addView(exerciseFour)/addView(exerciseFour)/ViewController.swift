
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oval = ovalView(frame: CGRect(x: 180, y: 50, width: 66, height: 66))
        oval.backgroundColor = UIColor.clear
        self.view.addSubview(oval)
        
        let oval1 = ovalView(frame: CGRect(x: 180, y: 120, width: 33, height: 33))
        self.view.addSubview(oval1)
        
        let oval2 = ovalView(frame: CGRect(x: 200, y: 150, width: 15, height: 15))
        self.view.addSubview(oval2)
        
        // Do any additional setup after loading the view, typically from a nib.
        let filemanager = FileManager.default
        let docurl = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first
        let document = docurl?.appendingPathComponent("image", isDirectory: true)
        if filemanager.fileExists(atPath: (document?.path)!) {
            let file = document?.appendingPathComponent("/dog.jpg")
            if filemanager.fileExists(atPath: (file?.path)!){
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: (file?.path)!))
                    let img = UIImage(data: data)
                    let imgView = UIImageView(image: img)
                    imgView.frame = CGRect(x: 10, y: 230, width: 400, height: 500)
                    self.view.addSubview(imgView)
                } catch {
                    print(error)
                }
            } else {
                let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544869348786&di=2cbc5ca5b74bf996196b6880e63ba5e6&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Db47784b054df8db1a8237427614ab721%2Fca1349540923dd54be592240db09b3de9c8248f4.jpg")
                do {
                    let data = try Data(contentsOf: url!)
                    try data.write(to: URL(fileURLWithPath: (file?.path)!), options: .atomicWrite)
                    let img = UIImage(data: data)
                    let imgview = UIImageView(image: img)
                    imgview.frame = CGRect(x: 10, y: 230, width: 400, height: 500)
                    self.view.addSubview(imgview)
                } catch {
                    print(error)
                }
            }
        } else {
            do {
                try filemanager.createDirectory(at: document!, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error)
            }
        }
    }
}

class ovalView: UIView {
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        UIColor.gray.setStroke()
        path.stroke()
        UIColor.green.setFill()
        path.fill()
        
    }
}
