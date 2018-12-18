//
//  ViewController.swift
//  exerciseEleven(foodTracker)
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 lyw. All rights reserved.
//

import UIKit
  //MARK: Properties
class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty || rating < 0  {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
