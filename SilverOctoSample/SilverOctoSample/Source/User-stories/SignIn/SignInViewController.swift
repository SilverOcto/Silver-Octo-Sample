//
//  SignInViewController.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 12/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import UIKit
import SwiftyDropbox

class SignInViewController: UIViewController
{
    @IBAction func signInButtonTapped(sender: UIButton)
    {
        Dropbox.authorizeFromController(self)
    }
}
