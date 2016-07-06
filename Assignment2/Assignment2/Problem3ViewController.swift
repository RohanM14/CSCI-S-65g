//
//  Problem3ViewController.swift
//  Assignment2
//
//  Created by Rohan Muthukumar on 6/30/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

class Problem3ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextView!
    var before:[[Bool]] = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))
    var numAliveBefore: Int = 0
    var numAliveAfter: Int = 0
    let object = Engine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Problem 3"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        numAliveBefore = 0
        numAliveAfter = 0
        before = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))

        for (index, element) in before.enumerate() {
            for (index1, element1) in element.enumerate(){
                if arc4random_uniform(3)==1 && element1 == false{
                    numAliveBefore += 1
                    before[index][index1] = true
                }
            }
        }
        let after = object.step(before)
        for (index, element) in after.enumerate() {
            for (index1, _) in element.enumerate(){
                if after[index][index1]{
                    numAliveAfter += 1
                }
            }
        }

        
       textBox.text = textBox.text.stringByAppendingString("Alive Before: " + String(numAliveBefore) + " ")
       textBox.text = textBox.text.stringByAppendingString("Alive After: " + String(numAliveAfter))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
