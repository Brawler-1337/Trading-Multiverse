//
//  ViewController.swift
//  TradeMultiverse
//
//  Created by Cameron on 4/13/16.
//  Copyright © 2016 Cameron Stratton. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    let ref = Firebase(url: "https://tradingmultiverse.firebaseio.com/")
    var user: User!
    var cards = [TradeBinder]()
    
    @IBOutlet weak var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
}

