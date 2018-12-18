//
//  ViewController.swift
//  exerciseNine(alert)
//
//  Created by student on 2018/12/16.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "please choose TFMEN", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "fjkRED", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "gyqxBLACK", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.black
        }))
        alert.addAction(UIAlertAction(title: "gyYELLOW", style: .destructive, handler: { (action) in
            self.view.backgroundColor = UIColor.yellow
        }))
        alert.addAction(UIAlertAction(title: "TFMEN", style: .cancel, handler: { (action) in
            self.view.backgroundColor = UIColor.darkGray
        }))
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Login", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            guard let username = alert.textFields?.first?.text,let password = alert.textFields?.last?.text else{
                return
            }
            print("username=\(username) password=\(password)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        alert.addTextField { (textField) in
            textField.placeholder = "username"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        present(alert,animated: true,completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

