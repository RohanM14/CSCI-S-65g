//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//
import Foundation

protocol GridProtocol {
    
    init(rows: UInt, cols: UInt)
    
    var rows: UInt { get }
    var cols: UInt { get }
    var grid: [[CellState]] { get set }
    
    func neighbors(coordinates: (r: Int, c: Int)) -> [(Int, Int)]
    
    subscript(row: UInt, col: UInt) -> CellState? { get set }

}
