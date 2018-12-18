//
//  ViewController.swift
//  yueshu(2)
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 lyw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let greenView = UIView()
        greenView.backgroundColor = UIColor.blue
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.gray
        
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        
        let stackView = UIStackView(arrangedSubviews: [greenView, yellowView, redView])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 25
        stackView.backgroundColor = UIColor.brown
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false 
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }


}

