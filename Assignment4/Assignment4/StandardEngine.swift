//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import Foundation


class StandardEngine: EngineProtocol{

    var delegate: EngineDelegate?
    var grid: GridProtocol = Grid(rows: 0, cols: 0)
    var refreshRate: Double = 0
    var refreshTimer: NSTimer?
    var rows: Int = 10{
        didSet{
            grid = Grid(rows: UInt(rows), cols: UInt(cols))
        }
    }
    var cols: Int = 10{
        didSet{
            grid = Grid(rows: UInt(rows), cols: UInt(cols))
        }
    }
    required init (rows: Int, cols: Int){
        self.rows = rows
        self.cols = cols
    }
    
    func step() -> GridProtocol{
        var after: [[CellState]]  = [[CellState]](count:Int(rows), repeatedValue: [CellState](count: Int(cols), repeatedValue: .Empty))
            var counter: [[Int]] = [[Int]](count: Int(rows), repeatedValue: [Int](count: Int(cols), repeatedValue: 0))
            var count: Int = 0
            for (index, element) in after.enumerate(){
                for (index1, _) in element.enumerate(){
                    count = 0
                    for value in grid.neighbors((index, index1)){
                        if grid[UInt(value.0), UInt(value.1)] == .Living || grid[UInt(value.0), UInt(value.1)] == .Born {
                            count += 1
                        }
                    }
                    counter[index][index1] = count
                }
            }
            
            
            for (index, element) in grid.grid.enumerate()
            {
                for (index1, _) in element.enumerate()
                {
                    switch grid[index, index1]{
                    case .Living, .Born:
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
                    case .Died, .Empty:
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
            return after
        }
        }
}