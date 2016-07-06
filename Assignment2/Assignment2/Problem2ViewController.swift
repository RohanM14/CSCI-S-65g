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
    var after:[[Bool]] = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))
    var counter:[[Int]] = [[Int]](count:4, repeatedValue:[Int](count:4, repeatedValue:0))
    var numAliveAfter:Int = 0
    var numAliveBefore: Int = 0
    var numLivingNeighbors:Int = 0
    
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
        
        numAliveBefore = 0
        numAliveAfter = 0
        numLivingNeighbors = 0
        before = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))
        after = [[Bool]](count:4, repeatedValue:[Bool](count:4, repeatedValue:false))
        counter = [[Int]](count:4, repeatedValue:[Int](count:4, repeatedValue:0))
        
        for (index, element) in before.enumerate() {
            for (index1, element1) in element.enumerate(){
                if arc4random_uniform(3)==1 && element1 == false{
                    numAliveBefore += 1
                    before[index][index1] = true
                    after[index][index1] = true
            }
        }
        }
       textBox.text = textBox.text.stringByAppendingString("Alive Before: " + String(numAliveBefore) + " ")
        
            for (index, element) in before.enumerate() {
                for (index1, _) in element.enumerate()
                {
                    numLivingNeighbors = 0
                    if (before[(index + 1) % before.count][(index1 + 1) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index + 1) % before.count][(index1) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index + 1) % before.count][(index1 - 1  + before.count) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index) % before.count][(index1 + 1) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index) % before.count][((index1 - 1  + before.count) % before.count)]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index - 1  + before.count) % before.count][(index1 + 1) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index - 1  + before.count) % before.count][(index1) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    if (before[(index - 1  + before.count) % before.count][(index1 - 1  + before.count) % before.count]){
                        numLivingNeighbors += 1;
                    }
                    counter[index][index1] = numLivingNeighbors
                }
            }
        

        for (index, element) in after.enumerate(){
            for (index1, _) in element.enumerate() {
                if after[index][index1] == true{
                    if counter[index][index1] == 0 || counter[index][index1] == 1{
                        after[index][index1] = false
                    }
                    else if counter[index][index1] == 2 || counter[index][index1] == 3{
                        numAliveAfter += 1
                    }
                    else{
                        after[index][index1] = false
                    }
                }
                else{
                    if counter[index][index1] == 3{
                        after[index][index1] = true
                        numAliveAfter += 1
                    }
                }
            }
            }
        textBox.text = textBox.text.stringByAppendingString("Alive After: " + String(numAliveAfter) + " ")

}
}