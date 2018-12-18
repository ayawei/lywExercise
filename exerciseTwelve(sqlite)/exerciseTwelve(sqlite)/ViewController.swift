//
//  ViewController.swift
//  exerciseTwelve(sqlite)
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 lyw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = db.open(dbPath: "", copyFile: true)
        let r = db.execute(sql: "create table if not exist person(name varchar(20),phone varchar(20))")
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(tfName)'")
        if let person = persons.first, let phone = person["phone"] as? String {
            tfPhone.text = phone
        }
    }
    
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person where name = '\(tfName)'")
    }
    
    @IBAction func add(_ sender: Any) {
        let r = db.execute(sql: "insert into person(name,phone) values('\(tfName.text)','\(tfPhone.text)')")
    }
    
    @IBAction func update(_ sender: Any) {
        let r = db.execute(sql: "update person set phone='\(tfPhone.text)' where name = '\(tfName)'")
    }
}

