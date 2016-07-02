//
//  Problem3ViewController.swift
//  Assignment2
//
//  Created by Rohan Muthukumar on 6/30/16.
//  Copyright © 2016 Rohan Muthukumar. All rights reserved.
//

import UIKit

class Problem3ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Problem 3"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        textBox.text = textBox.text.stringByAppendingString("The button was pressed.")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
