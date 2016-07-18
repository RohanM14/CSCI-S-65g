//
//  Grid.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/17/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import Foundation

class Grid: GridProtocol {
   
    
    required init(rows: UInt, cols: UInt){
        self.rows = rows
        self.cols = cols
        grid = [[CellState]](count:Int(rows), repeatedValue: [CellState](count: Int(cols), repeatedValue: .Empty))
    }

    var rows: UInt = 0
    var cols: UInt = 0
    var grid: [[CellState]]

    
    func neighbors(coordinates: (r: Int, c: Int)) -> [(Int, Int)]
    {
        var cellNeighbors: [(Int, Int)] = [(Int, Int)](count: 8, repeatedValue:(0, 0))
        cellNeighbors[0].0 = (coordinates.0 - 1 + grid.count) % grid.count
        cellNeighbors[1].0 = (coordinates.0 - 1 + grid.count) % grid.count
        cellNeighbors[2].0 = (coordinates.0 - 1 + grid.count) % grid.count
        cellNeighbors[3].0 = (coordinates.0) % grid.count
        cellNeighbors[4].0 = (coordinates.0) % grid.count
        cellNeighbors[5].0 = (coordinates.0 + 1) % grid.count
        cellNeighbors[6].0 = (coordinates.0 + 1) % grid.count
        cellNeighbors[7].0 = (coordinates.0 + 1) % grid.count
        cellNeighbors[0].1 = (coordinates.1 - 1 + grid[0].count) % grid[0].count
        cellNeighbors[1].1 = (coordinates.1) % grid[0].count
        cellNeighbors[2].1 = (coordinates.1 + 1) % grid[0].count
        cellNeighbors[3].1 = (coordinates.1 - 1 + grid[0].count) % grid[0].count
        cellNeighbors[4].1 = (coordinates.1 + 1) % grid[0].count
        cellNeighbors[5].1 = (coordinates.1 - 1 + grid[0].count) % grid[0].count
        cellNeighbors[6].1 = (coordinates.1) % grid[0].count
        cellNeighbors[7].1 = (coordinates.1 + 1 ) % grid[0].count
        return cellNeighbors
    }
    
    subscript(row: UInt, col: UInt) -> CellState? {
        get {
            if row < rows && col < cols{
                return grid[Int(row)][Int(col)]
            }
            else {
                return nil
            }
        }
        set (newValue) {
            if row < rows && col < cols{
                grid[Int(row)][Int(col)] = newValue!
            }
        }
    }

}
