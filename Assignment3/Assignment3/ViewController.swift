//
//  ViewController.swift
//  Assignment3
//
//  Created by Rohan Muthukumar on 7/6/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        var before:[[GridView.CellState]] = GridView.grid
        var after:[[GridView.CellState]] = [[GridView.CellState]](count:GridView.rows, repeatedValue:[GridView.CellState](count:GridView.cols, repeatedValue:.Empty))
        var counter:[[Int]] = [[Int]](count:GridView.rows, repeatedValue:[Int](count:GridView.cols, repeatedValue:0))
        var numLivingNeighbors:Int = 0
        
        for (index, element) in before.enumerate() {
            for (index1, element1) in element.enumerate()
            {
                numLivingNeighbors = 0
                if (before[(index + 1) % before.count][(index1 + 1) % before.count] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index + 1) % before.count][(index1) % before.count] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index + 1) % before.count][(index1 - 1  + before.count) % before.count] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index) % before.count][(index1 + 1) % before.count] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index) % before.count][((index1 - 1  + before.count) % before.count)] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index - 1  + before.count) % before.count][(index1 + 1) % before.count] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index - 1  + before.count) % before.count][(index1) % before.count] == .Empty){
                    numLivingNeighbors += 1;
                }
                if (before[(index - 1  + before.count) % before.count][(index1 - 1  + before.count) % before.count] == .Empty){
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
}
}