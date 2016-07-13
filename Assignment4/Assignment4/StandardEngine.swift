//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import Foundation

class StandardEnigine: EngineProtocol{
    
    func neighbors(givenArray: [[CellState]], coordinates: (r: Int, c: Int)) -> [(Int, Int)]
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
        cellNeighbors[0].1 = (coordinates.1 - 1 + givenArray[0].count) % givenArray[0].count
        cellNeighbors[1].1 = (coordinates.1) % givenArray[0].count
        cellNeighbors[2].1 = (coordinates.1 + 1) % givenArray[0].count
        cellNeighbors[3].1 = (coordinates.1 - 1 + givenArray[0].count) % givenArray[0].count
        cellNeighbors[4].1 = (coordinates.1 + 1) % givenArray[0].count
        cellNeighbors[5].1 = (coordinates.1 - 1 + givenArray[0].count) % givenArray[0].count
        cellNeighbors[6].1 = (coordinates.1) % givenArray[0].count
        cellNeighbors[7].1 = (coordinates.1 + 1 ) % givenArray[0].count
        return cellNeighbors
    }
    
    
    func step (before: [[CellState]]) -> [[CellState]] {
        var after: [[CellState]] = before
        var counter: [[Int]] = [[Int]](count: before.count, repeatedValue: [Int](count: before[0].count, repeatedValue: 0))
        var count: Int = 0
        for (index, element) in before.enumerate(){
            for (index1, _) in element.enumerate(){
                count = 0
                for value in neighbors(before, coordinates: (index, index1)){
                    if before[value.0][value.1] == .Living || before[value.0][value.1] == .Born {
                        count += 1
                    }
                }
                counter[index][index1] = count
            }
        }
        
        
        for (index, element) in before.enumerate()
        {
            for (index1, _) in element.enumerate()
            {
                if before[index][index1] == .Living || before[index][index1] == .Born
                {
                    if counter[index][index1] == 0 || counter[index][index1] == 1
                    {
                        after[index][index1] = .Died
                    }
                    else if counter[index][index1] == 2 || counter[index][index1] == 3
                    {
                        after[index][index1] = .Living
                    }
                    else
                    {
                        after[index][index1] = .Died
                    }
                }
                else
                {
                    if counter[index][index1] == 3
                    {
                        after[index][index1] = .Born
                    }
                    else
                    {
                        after[index][index1] = .Empty
                    }
                }
            }
        }
        return after
        
    }

}