//
//  ViewController.swift
//  UITextfiledTest
//
//  Created by Jenaral on 16/7/9.
//  Copyright © 2016年 Jenaral. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

    @IBOutlet var textFeildOne: UITextField!
    
    @IBOutlet var textFieldTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bindTextField()
    }
    
    func bindTextField() {
//        let textOne = textFeildOne.rac_textSignal().toSignalProducer().map { text in text as! String
//        }
        
        textFeildOne.rac_textSignal().toSignalProducer().startWithNext { [unowned self](text) in
            if let str = text as? String {
                self.textFieldTwo.text = str
            }
        }
        
        textFieldTwo.rac_textSignal().toSignalProducer().startWithNext { [unowned self](text) in
            if let str = text as? String {
                self.textFeildOne.text = str
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

