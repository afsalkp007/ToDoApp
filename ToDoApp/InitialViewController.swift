//
//  InitialViewController.swift
//  TodoApp
//
//  Created by User on 2/19/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class InitialViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            print("go to home")
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
   
}
