//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Rohan Muthukumar on 6/30/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextView!
    var before:[[Bool]] = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))
    var count = Int()
    var after:[[Bool]] = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Problem 2"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton){
        count = 0
        for (index, element) in before.enumerate() {
            for (index1, var element1) in element.enumerate(){
                if arc4random_uniform(3)==1 && element1 == false{
                    count += 1
                    element1 = true
                    after[index][index1] = true
            }
        }
        }
        
        textBox.text = textBox.text.stringByAppendingString("Alive Before: " + String(count) + " ")
    }
}