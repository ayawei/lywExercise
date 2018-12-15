
import UIKit

class lywViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //button
        view.backgroundColor = UIColor.lightGray
        let button = UIButton(frame: CGRect(x: 200, y: 250, width: 100, height: 30))
        button.setTitle("click me", for: .normal)
        view.addSubview(button)
        
        //label
        let label1 = UILabel(frame: CGRect(x: 200, y: 100, width: 100, height: 30))
        label1.text = "hello world"
        label1.textAlignment = .center
        label1.textColor = UIColor.yellow
        label1.backgroundColor = UIColor.black
        view.addSubview(label1)
        
        button.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
    }
    
    @IBAction func clickBtn() {
        if let label = view.subviews[1] as? UILabel {
            if label.text! == "hello world" {
                label.text = "贵洋千玺"
            }
        }
    }

}

