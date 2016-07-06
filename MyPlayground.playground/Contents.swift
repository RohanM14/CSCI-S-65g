//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let liveCells = cells.filter { $0.state == .Alive }
let deadCells = cells.filter { $0.state != .Alive }
let dyingCells = liveCells.filter { livingNeighboursForCell($0) !~= 2...3 }
let newLife =  deadCells.filter { livingNeighboursForCell($0) == 3 }

// updating the world state
newLife.each { (cell: Cell) in cell.state = .Alive }
dyingCells.each { (cell: Cell) in cell.state = .Dead }
class Cell {
    let x: Int, y: Int
    var state: State
    
    init (x: Int, y: Int) {
        self.x = x
        self.y = y
        state = .NeverLived
    }
}

enum State {
    case Alive, Dead, NeverLived
}

class World {
    
    let cells: [Cell]
    let dimensions: Int = 20
    
    init() {
        cells = [Cell]()
        
        // create the cells
        for x in 0..<dimensions {
            for y in 0..<dimensions {
                cells.append(Cell(x: x, y: y))
            }
        }
    }
    
    subscript (x: Int, y: Int) -> Cell? {
        return cells.filter { $0.x == x && $0.y == y }.first
    }
}
class World {
    ...
    func iterate() {
        let deadCells = cells.filter { $0.state != .Alive }
    }
}
let deadCells = cells.filter { $0.state != .Alive }
let newLife =  deadCells.filter { livingNeighboursForCell($0) == 3 }

let cellsAreNeighbours = {
    (op1: Cell, op2: Cell) -> Bool in
    let delta = (abs(op1.x - op2.x), abs(op1.y - op2.y))
    switch (delta) {
    case (1,1), (1,0), (0,1):
        return true
    default:
        return false
    }
}

let neighboursForCell = {
    (cell: Cell) -> [Cell] in
    return self.cells.filter { cellsAreNeighbours(cell, $0)}
}
let livingNeighboursForCell = {
    (cell: Cell) -> Int in
    neighboursForCell(cell).filter{ $0.state == State.Alive }.count
}
let liveCells = cells.filter { $0.state == .Alive }
let dyingCells = liveCells.filter { livingNeighboursForCell($0) !~= 2...3 }

infix operator !~= {}

func !~= <I : IntervalType>(value: I.Bound, pattern: I) -> Bool {
    return !(pattern ~= value)
}

extension Array {
    func each<T>(fn: (T) -> ()) {
        for item in self {
            let itemAsT = item as T
            fn(itemAsT)
        }
    }
}
// updating the world state
newLife.each { (cell: Cell) in cell.state = .Alive }
dyingCells.each { (cell: Cell) in cell.state = .Dead }
func iterate() {
    
    // utility functions - cannot reference a local function from another
    // local function, hence defined as constant closures
    let cellsAreNeighbours = {
        (op1: Cell, op2: Cell) -> Bool in
        let delta = (abs(op1.x - op2.x), abs(op1.y - op2.y))
        switch (delta) {
        case (1,1), (1,0), (0,1):
            return true
        default:
            return false
        }
    }
    
    let neighboursForCell = {
        (cell: Cell) -> [Cell] in
        return self.cells.filter { cellsAreNeighbours(cell, $0)}
    }
    
    let livingNeighboursForCell = {
        (cell: Cell) -> Int in
        neighboursForCell(cell).filter{ $0.state == State.Alive }.count
    }
    
    // rules of life
    let liveCells = cells.filter { $0.state == .Alive }
    let deadCells = cells.filter { $0.state != .Alive }
    
    let dyingCells = liveCells.filter { livingNeighboursForCell($0) !~= 2...3 }
    let newLife =  deadCells.filter { livingNeighboursForCell($0) == 3 }
    
    // updating the world state
    newLife.each { (cell: Cell) in cell.state = .Alive }
    dyingCells.each { (cell: Cell) in cell.state = .Dead }
}
