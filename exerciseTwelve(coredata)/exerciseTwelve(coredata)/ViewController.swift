//
//  ViewController.swift
//  exerciseTwelve(coredata)
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let p = Person(context: context)
        p.name = tfName.text
        p.phone = tfPhone.text
        appDelegate.saveContext()
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@",tfName.text!)
        let persons = try?context.fetch(fetch)
        if let p = persons?.first {
            p.phone = tfPhone.text
        }
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@",tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
            }
    }
    
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@",tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfPhone.text = p.phone
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

