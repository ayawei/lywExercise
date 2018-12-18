//
//  ViewController.swift
//  exercseNine
//
//  Created by student on 2018/11/25.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        for i in 1...3 {
            let imageView = UIImageView(image:UIImage(named:"\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x:CGFloat(i-1) * scrollView.bounds.width,y:0,width:scrollView.bounds.width,height:scrollView.bounds.height)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width:scrollView.bounds.width * 7,height:scrollView.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
    }
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x:CGFloat(currentPage) * scrollView.bounds.width,y: 0,width:scrollView.bounds.width,height:scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControl.currentPage = Int(currentPage)
    }
    
}

