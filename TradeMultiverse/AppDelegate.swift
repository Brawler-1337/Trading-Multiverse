//
//  AppDelegate.swift
//  TradeMultiverse
//
//  Created by Cameron on 4/13/16.
//  Copyright © 2016 Cameron Stratton. All rights reserved.
//

import UIKit
import Firebase

let FirebaseUrl = "https://tradingmultiverse.firebaseio.com/"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    override init() {
        super.init()
        Firebase.defaultConfig().persistenceEnabled = true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // Initialize sign-in
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().delegate = self // Firebase tutorial has this line in the ViewController file. Why?
        
        return true
    }
    
    // Is this needed? It's part of the Firebase tutorial.
    // Handle incoming URLs
    func application(application: UIApplication,
        openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
            return GIDSignIn.sharedInstance().handleURL(url,
                sourceApplication: sourceApplication,
                annotation: annotation)
    }
    
    func application(application: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        return GIDSignIn.sharedInstance().handleURL(url,
            sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as? String,
            annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
    }
    
    
    // Firebase tutorial puts this in ViewController. Why?
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            //let userId = user.userID                  // For client-side use only!
            //let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            //let givenName = user.profile.givenName
            //let familyName = user.profile.familyName
            //let email = user.profile.email
            // ...
            
            print("User name: \(fullName)")
            
            /*
            ref.authWithOAuthProvider("google", token: user.authentication.accessToken, withCompletionBlock: { (error, authData) in
                // User is logged in!
            })
            */
            
            let myStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let protectedPage = myStoryboard.instantiateViewControllerWithIdentifier("ProtectedPageViewController") as! ProtectedPageViewController
            
            let protectedPageNav = UINavigationController(rootViewController: protectedPage)
            
            self.window?.rootViewController = protectedPageNav
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!, withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

