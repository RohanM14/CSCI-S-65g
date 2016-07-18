//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import Foundation

class StandardEnigine: EngineProtocol{

    var delegate: EngineDelegate?
    var grid: GridProtocol = Grid(rows: 0, cols: 0)
    var refreshRate: Double = 0
    var refreshTimer: NSTimer?
    var rows: UInt = 10{
        didSet{
            grid = Grid(rows: rows, cols: cols)
        }
    }
    var cols: UInt = 10{
        didSet{
            grid = Grid(rows: rows, cols: cols)
        }
    }
    required init (rows: Int, cols: Int){
        self.rows = UInt(rows)
        self.cols = UInt(cols)
    }
    
    func step() -> GridProtocol{
        var after: [[CellState]]  = [[CellState]](count:Int(rows), repeatedValue: [CellState](count: Int(cols), repeatedValue: .Empty))
            var counter: [[Int]] = [[Int]](count: grid.count, repeatedValue: [Int](count: grid[0].count, repeatedValue: 0))
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