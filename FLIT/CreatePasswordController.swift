//
//  CreatePasswordController.swift
//  FLIT
//
//  Created by Ethan on 11/12/15.
//  Copyright © 2015 Ethan. All rights reserved.
//

import UIKit
import Parse

class CreatePasswordController: UIViewController {

    
    @IBOutlet weak var pass1: UITextField!
    @IBOutlet weak var pass2: UITextField!
    @IBOutlet weak var subButton: UIButton!
    var userName: String?
    var userEmail: String?
    var otherReason: String?
    var appPurpose: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //format submit button
        subButton.layer.cornerRadius = 5
        subButton.layer.borderWidth = 4
        subButton.layer.borderColor = UIColor.blackColor().CGColor
        
        /*
        //load information saved from sing up screen
        let savedInfo = NSUserDefaults.standardUserDefaults()
        userName = savedInfo.stringForKey("userName")
        print(userName)
        userEmail = savedInfo.stringForKey("userEmail")
        print(userEmail)
        otherReason = savedInfo.stringForKey("OtherReason")
        print(otherReason)
        appPurpose = savedInfo.stringForKey("AppPurpose")
        print(appPurpose)*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check if passwords match
    @IBAction func checkPass(sender: UIButton) {
        if(pass1.text == pass2.text){
            //passwords matched, save information to Parse and continue
            let userInfo = PFObject(className: "UserInfo")
            userInfo["Reason"] = appPurpose
            userInfo["userName"] = userName
            userInfo["userEmail"] = userEmail
            if(otherReason != nil){
                userInfo["otherReason"] = otherReason
            }
            userInfo["password"] = pass1.text
            userInfo.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")}
            
        }
        else{//passwords did not match
            pass1.text = nil
            pass2.text = nil
            pass1.attributedPlaceholder = NSAttributedString(string: "E-Mails Did Not Match", attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
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
