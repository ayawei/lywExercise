//
//  ViewController.swift
//  MuiltMvc
//
//  Created by student on 2018/12/7.
//  Copyright © 2018年 student. All rights reserved.
//
//视频看到22:45
import UIKit

protocol StudentProtocol {
    func change(name:String,No:String)
}

class FirstViewController: UIViewController ,StudentProtocol{
    
    func change(name: String, No: String) {
        self.name = name
        self.No = No
    }
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNo: UITextField!
    
    var name = ""
    var No = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = No
        tfName.text = name
    }
    
    @IBAction func showSecondVC(_ sender: Any) {
        No = tfNo.text!
        name = tfName.text!
        let secVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "SecondVC")as!SecondViewController
        secVC.No = No
        secVC.name = name
        secVC.delegate = self
        self.navigationController?.pushViewController(secVC, animated: true)
        
    }
    
    @IBAction func showThirdVc(_ sender: Any) {
        let thirdVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "ThirdVC")
        present(thirdVC,animated: true,completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

