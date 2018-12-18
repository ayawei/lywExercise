//
//  ViewController.swift
//
//
//  Created by student. on 2018/11/28.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var nameTextFied: UITextField!
    var perArray = [Person]()
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var personTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perArray.append(Student(name: "tulaji", age: 100, gender: "man", grade: 0))
        perArray.append(Teacher(name: "贵洋千玺", age: 30, gender: "man", grade: 100))
        perArray.append(Student(name: "高源", age: 35, gender: "man", grade: 100))
        perArray.append(Teacher(name: "樊俊凯", age: 33, gender: "man", grade: 99))
        perArray.append(Student(name: "佳ge", age: 16, gender: "woman", grade: 98))
        perArray.append(Student(name: "薛薛", age: 18, gender: "woman", grade: 100))
        perArray.append(Student(name: "雅婷", age: 17 ,gender: "woman", grade: 95))
    }
    
    @IBAction func addClick(_ sender: UIButton) {
        if let name = nameTextFied.text{
            perArray.append(Person(name:name,age:99,gen:"man",grade:0))
            personTableView.reloadData()
        }
        nameTextFied.resignFirstResponder()
    }
    
    @IBAction func editCliked(_ sender: UIButton) {
        if let row = personTableView.indexPathForSelectedRow?.row{
            if let name = nameTextFied.text{
                perArray[row].name = name
                personTableView.reloadData()
            }
        }
    }
    
    @IBAction func deleteCliked(_ sender: UIButton) {
         personTableView.isEditing = !personTableView.isEditing
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return perArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: personTableViewCell!
        cell = (tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! personTableViewCell)
        
        let stu = perArray[indexPath.row]
        
        cell.name.text = stu.name
        cell.age.text = "\(stu.age)"
        cell.gender.text = stu.gender
        cell.grade.text = "\(stu.grade)"
        
        cell.Pic.image = UIImage(named: "dog")
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            perArray.remove(at:indexPath.row)
            tableView.deleteRows(at:[indexPath],with:.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = perArray.remove(at: sourceIndexPath.row)
        perArray.insert(source, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "You  choose:\(perArray[indexPath.row].name) is a \(perArray[indexPath.row])"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

