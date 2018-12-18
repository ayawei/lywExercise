//
//  ViewController.swift
//  exercise(Thirteen)
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var timer: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.timer.text = "\(self.count)"
            print("timer thread:\(Thread.current)")
        }.fire()
    }
    @IBAction func caculate(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
             print("Run thred:\(Thread.current)")
            for i in 1...1000{
                usleep(10000)
                sum += i
            }
            DispatchQueue.main.async {
                 self.testLabel.text = "sum:\(sum)"
            }
        }
    }
}

