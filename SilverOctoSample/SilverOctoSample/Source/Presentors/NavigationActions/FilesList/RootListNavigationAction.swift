//
//  RootListNavigationAction.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 28/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import Foundation

class RootListNavigationAction : NavigationAction
{
    override class func storyboardName() -> String
    {
        return "Main"
    }
    
    override class func viewControllerIdentifier() -> String
    {
        return "RootListViewController"
    }
}
