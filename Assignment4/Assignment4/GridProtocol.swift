//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

protocol GridProtocol {
    
    init(rows: Int, cols: Int)
    
    var rows: UInt { get }
    var cols: UInt { get }
    
    func neighbors(givenArray: [[CellState]], coordinates: (r: Int, c: Int)) -> [(Int, Int)]
    
    subscript(row: UInt, col: UInt) -> CellState? { get set }

}
