//
//  HomeMenuController.swift
//  FLIT
//
//  Created by Ethan on 11/2/15.
//  Copyright © 2015 Ethan. All rights reserved.
//

import UIKit
import Parse

class HomeMenuController: UIViewController, UITextFieldDelegate {
  
    var lText: String?
    @IBOutlet weak var namePrompt: UILabel!
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var emailPrompt: UILabel!
    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var reasonPrompt: UILabel!
    @IBOutlet weak var reasonBox: UITextField!
    @IBOutlet weak var subButton: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameBox.placeholder = "Full Name"
        
        //change display based on button press
        if(lText == "Other"){
            emailBox.placeholder = "Primary E-Mail"
            reasonBox.placeholder = "Reason"
        } else{
            emailBox.placeholder = "Fontbonne E-Mail"
            reasonPrompt.hidden = true
            reasonBox.hidden = true
            reasonBox.text = ""
        }
        
        
        subButton.layer.cornerRadius = 5
        subButton.layer.borderWidth = 4
        subButton.layer.borderColor = UIColor.blackColor().CGColor
        
        self.nameBox.delegate = self
        self.emailBox.delegate = self
        self.reasonBox.delegate = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! CreatePasswordController
        destination.userName = nameBox.text
        destination.userEmail = emailBox.text
        destination.otherReason = reasonBox.text
        destination.appPurpose = lText
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func checkInfo(sender: UIButton) {
        var error = 0
        
        //check if user entered a name
        if(nameBox.text!.isEmpty){
            error++
            nameBox.attributedPlaceholder = NSAttributedString(string: "Name Required", attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            
        }
        
        //check if user entered an email
        if(emailBox.text!.isEmpty){
            error++
            emailBox.attributedPlaceholder = NSAttributedString(string: "E-Mail Required", attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        else{//if user entered an email, check if they are a fontbonne student
            if(lText == "Other"){
                //do nothing
            } else{//if they did not choose "Other" as their reason, make sure they enter a fontbonne email
                if(emailBox.text!.lowercaseString.rangeOfString("@fontbonne.edu") == nil){
                    error++
                    
                    emailBox.text = nil
                    emailBox.attributedPlaceholder = NSAttributedString(string: "Fontbonne E-Mail Required", attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
                }
            }

        }
        //output the number of errors
        print(error)
        
        //if there aren't any errors, save information to Parse
        if(error == 0){
            /*
            //this means user has entered correct information
            //Save user information to NSUserDefaults
            let savedInfo = NSUserDefaults.standardUserDefaults()
            savedInfo.setObject(nameBox.text, forKey: "userName")
            savedInfo.setObject(emailBox.text, forKey: "userEmail")
            savedInfo.setObject(reasonBox.text, forKey: "otherReason")
            savedInfo.setObject(lText, forKey: "AppPurpose")*/
            
            //segue to next screen
            self.performSegueWithIdentifier("InfoSubmitted", sender: self)
            
            
            //Saving information to Parse, will use in password screen
            /*
            let userInfo = PFObject(className: "UserInfo")
            userInfo["Reason"] = lText
            userInfo["userName"] = nameBox.text
            userInfo["userEmail"] = emailBox.text
            userInfo["otherReason"] = reasonBox.text
            userInfo.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")}*/
        }
    }
    
    
    //back button pressed from password screen
    @IBAction func returned2(segue: UIStoryboardSegue){
        //returned to reason selection
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
