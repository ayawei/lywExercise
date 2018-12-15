
import UIKit

class lywViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //添加button和label
        //button
        view.backgroundColor = UIColor.lightGray
        let button = UIButton(frame: CGRect(x: 20, y: 150, width: 100, height: 30))
        button.setTitle("click me", for: .normal)
        view.addSubview(button)
        
        //label
        let label1 = UILabel(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
        label1.text = "hello world"
        label1.textAlignment = .center
        label1.textColor = UIColor.yellow
        label1.backgroundColor = UIColor.black
        view.addSubview(label1)
        
        button.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        
        //添加图片
        let oval = ovalView(frame: CGRect(x: 180, y: 50, width: 100, height: 100))
        oval.backgroundColor = UIColor.clear
        self.view.addSubview(oval)
        
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
    
    
    @IBAction func clickBtn() {
        if let label = view.subviews[1] as? UILabel {
            if label.text! == "hello world" {
                label.text = "贵洋千玺"
            }
        }
    }
    
    
}

//图形类
class ovalView: UIView {
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        UIColor.gray.setStroke()
        path.stroke()
        UIColor.green.setFill()
        path.fill()
        
    }
}

