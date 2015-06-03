//
//  AuthenticationsViewController.swift
//  q
//
//  Created by Jesse Shawl on 5/7/15.
//  Copyright (c) 2015 Jesse Shawl. All rights reserved.
//

import UIKit

class AuthenticationsViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var sendingView:GroupsTableViewController?
    @IBAction func signUp(sender: AnyObject) {
        //var deviceToken = NSUserDefaults.standardUserDefaults().objectForKey("token") as! NSData
        var user = User(user: email.text, password: password.text)
        user.signUp({ (authenticationToken:String, userId:Int) in
            // authenticationToken
            NSOperationQueue.mainQueue().addOperationWithBlock {
                self.dismissViewControllerAnimated(true, completion: nil)
                Token(userId: userId)
                self.sendingView?.viewDidLoad()
            }
            
            }, errorcallback: { (error:String) in
                let alertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    // ...
                }
                alertController.addAction(cancelAction)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // ...
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // ...
                }
                
        })
    }
    @IBAction func login(sender: AnyObject) {
        
           }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginButton.layer.cornerRadius = 3
        signUpButton.layer.borderWidth = 2.0
        signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
        signUpButton.layer.cornerRadius = 3
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destinationViewController as! loginViewController
        vc.authView = self
    }
      /**/

}
