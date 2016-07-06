//
//  Engine.swift
//  Assignment2
//
//  Created by Rohan Muthukumar on 7/3/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

class Engine: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func step(before: Array<Array<Bool>>) -> [[Bool]]
    {
        var numLivingNeighbors: Int = 0
        var counter:[[Int]] = [[Int]](count:before.count, repeatedValue:[Int](count:before[0].count, repeatedValue:0))
        var after:[[Bool]] = [[Bool]](count:before.count, repeatedValue:[Bool](count:before[0].count, repeatedValue:false))
        var numAlive: Int = 0


        for (index, element) in before.enumerate()
        {
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
        
        
        for (index, element) in before.enumerate()
        {
            for (index1, _) in element.enumerate()
            {
                if before[index][index1] == true
                {
                    if counter[index][index1] == 0 || counter[index][index1] == 1
                    {
                        after[index][index1] = false
                    }
                    else if counter[index][index1] == 2 || counter[index][index1] == 3
                    {
                        numAlive += 1
                        after[index][index1] = true
                    }
                    else
                    {
                        after[index][index1] = false
                    }
                }
                else
                {
                    if counter[index][index1] == 3
                    {
                        after[index][index1] = true
                        numAlive += 1
                    }
                }
            }
        }
        return after
    }
    
    func neighbors(givenArray: [[Bool]], coordinates: (r: Int, c: Int)) -> [(Int, Int)]
    {
        var cellNeighbors: [(Int, Int)] = [(Int, Int)](count: 8, repeatedValue:(0, 0))
        cellNeighbors[0].0 = (coordinates.0 - 1 + givenArray.count) % givenArray.count
        cellNeighbors[1].0 = (coordinates.0 - 1 + givenArray.count) % givenArray.count
        cellNeighbors[2].0 = (coordinates.0 - 1 + givenArray.count) % givenArray.count
        cellNeighbors[3].0 = (coordinates.0) % givenArray.count
        cellNeighbors[4].0 = (coordinates.0) % givenArray.count
        cellNeighbors[5].0 = (coordinates.0 + 1) % givenArray.count
        cellNeighbors[6].0 = (coordinates.0 + 1) % givenArray.count
        cellNeighbors[7].0 = (coordinates.0 + 1) % givenArray.count
        cellNeighbors[0].1 = (coordinates.1 - 1 + givenArray.count) % givenArray.count
        cellNeighbors[1].1 = (coordinates.1) % givenArray.count
        cellNeighbors[2].1 = (coordinates.1 + 1) % givenArray.count
        cellNeighbors[3].1 = (coordinates.1 - 1 + givenArray.count) % givenArray.count
        cellNeighbors[4].1 = (coordinates.1 + 1) % givenArray.count
        cellNeighbors[5].1 = (coordinates.1 - 1 + givenArray.count) % givenArray.count
        cellNeighbors[6].1 = (coordinates.1) % givenArray.count
        cellNeighbors[7].1 = (coordinates.1 + 1 ) % givenArray.count
        return cellNeighbors
    }
    
    func step2(before: Array<Array<Bool>>) -> [[Bool]]
    {
        var numLivingNeighbors: Int = 0
        var counter:[[Int]] = [[Int]](count:before.count, repeatedValue:[Int](count:before[0].count, repeatedValue:0))
        var after:[[Bool]] = [[Bool]](count:before.count, repeatedValue:[Bool](count:before[0].count, repeatedValue:false))
        var numAlive: Int = 0
        
        
        for (index, element) in before.enumerate()
        {
            for (index1, _) in element.enumerate()
            {
                for value in neighbors(before, coordinates: (index, index1))
                {
                    if before[value.0][value.1]{
                    numLivingNeighbors += 1
                }
                    counter[index][index1] = numLivingNeighbors
            }
        }
        
        
        for (index, element) in before.enumerate()
        {
            for (index1, _) in element.enumerate()
            {
                if before[index][index1] == true
                {
                    if counter[index][index1] == 0 || counter[index][index1] == 1
                    {
                        after[index][index1] = false
                    }
                    else if counter[index][index1] == 2 || counter[index][index1] == 3
                    {
                        numAlive += 1
                        after[index][index1] = true
                    }
                    else
                    {
                        after[index][index1] = false
                    }
                }
                else
                {
                    if counter[index][index1] == 3
                    {
                        after[index][index1] = true
                        numAlive += 1
                    }
                }
            }
        }
    }
        return after

}
}