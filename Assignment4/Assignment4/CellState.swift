//
//  CellState.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import Foundation

enum CellState: String {
    case Living, Empty, Born, Died
    
    func description() -> String{
        switch self{
        case Living: return "Living"
        case Empty: return "Empty"
        case Born: return "Born"
        case Died: return "Died"
        }
    }
    
    func allValues() -> [String] {
        let returnedArray: [String] = [Living.description(), Empty.description(), Born.description(), Died.description()]
        return returnedArray
    }
    
    mutating func toggle(value:CellState) -> CellState{
        switch self {
        case Living, Born: self = Empty
        case Empty, Died: self = Living
        }
        return self
    }
    
}
