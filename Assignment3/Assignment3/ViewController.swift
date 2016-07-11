//
//  ViewController.swift
//  Assignment3
//
//  Created by Rohan Muthukumar on 7/6/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gridView: GridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        gridView.grid = gridView.iterate(gridView.grid)
        gridView.setNeedsDisplay()
    }
}