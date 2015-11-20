//
//  ViewController.swift
//  FLIT
//
//  Created by Ethan on 10/26/15.
//  Copyright © 2015 Ethan. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var intButton: UIButton!
    @IBOutlet weak var aidButton: UIButton!
    @IBOutlet weak var probButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    var reason: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up buttons to have rounded black borders
        intButton.layer.cornerRadius = 5
        intButton.layer.borderWidth = 4
        intButton.layer.borderColor = UIColor.blackColor().CGColor
        
        aidButton.layer.cornerRadius = 5
        aidButton.layer.borderWidth = 4
        aidButton.layer.borderColor = UIColor.blackColor().CGColor
        
        probButton.layer.cornerRadius = 5
        probButton.layer.borderWidth = 4
        probButton.layer.borderColor = UIColor.blackColor().CGColor
        
        otherButton.layer.cornerRadius = 5
        otherButton.layer.borderWidth = 4
        otherButton.layer.borderColor = UIColor.blackColor().CGColor
        
        //test run for storing parse data
        /*let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //set label text to reason
        let destination = segue.destinationViewController as! HomeMenuController
        destination.lText = reason
    }

    //when INT 105 button selected
    @IBAction func INTReason(sender: UIButton) {
        reason = "INT 105"
        self.performSegueWithIdentifier("ReasonSelected", sender: self)
    }
    
    //when Aid Exhaustion button selected
    @IBAction func AidReason(sender: UIButton) {
        reason = "Aid Exhaustion"
        self.performSegueWithIdentifier("ReasonSelected", sender: self)
    }
    
    //when Academic Probation button selected
    @IBAction func APReason(sender: UIButton) {
        reason = "Academic Probation"
        self.performSegueWithIdentifier("ReasonSelected", sender: self)
    }
    
    //when other button selected
    @IBAction func OtherReason(sender: UIButton) {
        reason = "Other"
        self.performSegueWithIdentifier("ReasonSelected", sender: self)
    }
    
    @IBAction func returned(segue: UIStoryboardSegue){
        //returned to reason selection
    }
    

}

