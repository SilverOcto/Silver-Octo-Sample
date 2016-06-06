//
//  SignInNavigationAction.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 26/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import UIKit

class SignInNavigationAction : NavigationAction
{
    override class func storyboardName() -> String
    {
        return "Main"
    }
    
    override class func viewControllerIdentifier() -> String
    {
        return "SignInViewController"
    }
}