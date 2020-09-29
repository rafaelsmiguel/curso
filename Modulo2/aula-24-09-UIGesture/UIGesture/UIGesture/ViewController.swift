//
//  ViewController.swift
//  UIGesture
//
//  Created by Rafael Miguel on 24/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapped(sender:)))
        redView.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwiped(sender:)))
        blackView.addGestureRecognizer(swipe)
        swipe.direction = .right
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(sender:)))
        blueView.addGestureRecognizer(longPress)
        longPress.minimumPressDuration = 3.0
    }
    
    @objc func didTapped(sender:UITapGestureRecognizer) {
        print("ViewDidTapped")
        sender.view?.backgroundColor = .green
    }
    
    @objc func didSwiped(sender:UITapGestureRecognizer) {
       print("ViewDidSwiped")
        sender.view?.backgroundColor = .gray
    }
    
    @objc func didLongPress(sender:UITapGestureRecognizer) {
       print("ViewDidLongPress")
       sender.view?.backgroundColor = .systemPink
    }
    
    
    
    
    
    
    


}

