//
//  SecondViewController.swift
//  MuiltMvc
//
//  Created by student on 2018/12/7.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name = ""
    var No = ""
    
    var delegate:StudentProtocol?
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNo.text = No
        tfName.text = name
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        No = tfNo.text!
        name = tfName.text!
       
        delegate?.change(name: name, No: No)
        navigationController?.popViewController(animated: true)
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
