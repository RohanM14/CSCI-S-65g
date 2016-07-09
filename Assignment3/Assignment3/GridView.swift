//
//  GridView.swift
//  Assignment3
//
//  Created by Rohan Muthukumar on 7/6/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    @IBInspectable var livingColor: UIColor = UIColor.yellowColor()
    @IBInspectable var emptyColor: UIColor = UIColor.grayColor()
    @IBInspectable var bornColor: UIColor = UIColor.greenColor()
    @IBInspectable var diedColor: UIColor = UIColor.brownColor()
    @IBInspectable var gridColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var gridWidth: CGFloat = 0
    var grid: [[CellState]]!
    @IBInspectable var rows: Int = 20{
        didSet{
            grid = [[CellState]](count:rows, repeatedValue: [CellState](count: cols, repeatedValue: .Empty))
        }
    }
    @IBInspectable var cols: Int = 20{
        didSet{
            grid = [[CellState]](count:rows, repeatedValue: [CellState](count: cols, repeatedValue: .Empty))
        }
    }
    var rowNumber = 0
    var colNumber = 0
    
    enum CellState: String {
        case Living, Empty, Born, Died
        
        func description() -> String{
            switch self{
            case Living: return Living.rawValue
            case Empty: return Empty.rawValue
            case Born: return Born.rawValue
            case Died: return Died.rawValue
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
    
    override func drawRect(rect: CGRect)
    {
        let width = bounds.width/CGFloat(rows)
        let height = bounds.height/CGFloat(cols)
        for (r, element) in grid.enumerate(){
            for (c, element1) in element.enumerate(){
                let cellRect: CGRect = CGRect(
                    x: (width * CGFloat(r)),
                    y: (height * CGFloat(c)),
                    width: width,
                    height: height)
                switch element1{
                case .Living:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    livingColor.setFill()
                    cell.fill()
                case .Died:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    diedColor.setFill()
                    cell.fill()
                case .Born:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    bornColor.setFill()
                    cell.fill()
                case .Empty:
                    let cell = UIBezierPath(ovalInRect: cellRect)
                    emptyColor.setFill()
                    cell.fill()
                }
                
            }
        }
        
        
        
        for x in 0...rows
        {
            let lineWidth: CGFloat = gridWidth
            let plusHeight: CGFloat = bounds.height
            let plusWidth: CGFloat = bounds.width
            
            let plusPath = UIBezierPath()
            
            plusPath.lineWidth = lineWidth
            
            plusPath.moveToPoint(CGPoint(
                x:(bounds.width/CGFloat(rows)) * CGFloat(x),
                y:bounds.height/2 - plusHeight/2))
            
            plusPath.addLineToPoint(CGPoint(
                x:(bounds.width/CGFloat(rows)) * CGFloat(x),
                y:bounds.height/2 + plusHeight/2))
            
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2  - plusWidth/2,
                y:(bounds.height/CGFloat(cols)) * CGFloat(x)))
            
            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + plusWidth/2,
                y:(bounds.height/CGFloat(cols)) * CGFloat(x)))
            
            gridColor.setStroke()
            
            plusPath.stroke()
        }
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position: CGPoint = touch.locationInView(self)
            rowNumber = Int(position.x) / ((Int(bounds.width) / cols) + 1)
            colNumber = Int(position.y) / ((Int(bounds.height) / rows) + 1)
            var changingCell = grid[rowNumber][colNumber]
            let changedCell = changingCell.toggle(changingCell)
            grid[rowNumber][colNumber] = changedCell
            let width = bounds.width/CGFloat(rows)
            let height = bounds.height/CGFloat(cols)
            let cellRect: CGRect = CGRect(
                x: (width * CGFloat(rowNumber)),
                y: (height * CGFloat(colNumber)),
                width: width,
                height: height)
            [self.setNeedsDisplayInRect(cellRect)]
        }
    }
    
    
}
