//
//  ViewController.swift
//  exerciseThirteen(2)
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://www.baidu.com"){
            webView.loadRequest(URLRequest(url: url))
        }
    }
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: urlTF.text!){
            webView.loadRequest(URLRequest(url: url))
        }
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }

    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
}

