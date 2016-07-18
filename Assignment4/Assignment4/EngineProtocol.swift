//
//  EngineProtocol.swift
//  Assignment4
//
//  Created by Rohan Muthukumar on 7/13/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import Foundation

protocol EngineProtocol{

    init (rows: Int, cols: Int)
    var delegate: EngineDelegate { get set }
    var grid: GridProtocol { get }
    var refreshRate: Double { get set }
    var refreshTimer: NSTimer { get set }
    var rows: Int { get set }
    var cols: Int { get set }
    func step() -> GridProtocol
    
}

extension EngineProtocol{
    var refreshRate: Double {
        return 0
    }
}