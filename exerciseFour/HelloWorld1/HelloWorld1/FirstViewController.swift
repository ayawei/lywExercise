//
//  FirstViewController.swift
//  HelloWorld1
//
//  Created by student on 2018/10/18.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        label.text = "HelloWorld!~"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.center = self.view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Click Me", for: .normal)
        //button.setTitle("I am happy", for: .highlighted)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
    }
    
    @IBAction func btnClicked(){
        if let label = view.subviews.first as? UILabel{
            label.text = "i am clicked"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
