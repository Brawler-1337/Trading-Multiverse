//
//  ProtectedPageViewController.swift
//  TradeMultiverse
//
//  Created by Cameron on 4/18/16.
//  Copyright © 2016 Cameron Stratton. All rights reserved.
//

import UIKit

class ProtectedPageViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutButtonTapped(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        
        // Back to Sign In page
        let signInPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let signInPageNav = UINavigationController(rootViewController: signInPage)
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = signInPageNav
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
