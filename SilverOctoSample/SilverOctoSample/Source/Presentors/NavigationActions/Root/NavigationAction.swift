//
//  NavigationAction.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 25.03.16.
//  Copyright © 2016 Lenhador. All rights reserved.
//

import UIKit

class NavigationAction
{
    // Initialization
    
    class func storyboardName() -> String
    {
        return ""
    }
    
    class func viewControllerIdentifier() -> String
    {
        return ""
    }
    
    class func storyboard() -> UIStoryboard
    {
        return UIStoryboard(name: storyboardName(), bundle: nil)
    }
    
    class func viewControllerInstance() -> UIViewController
    {
        return storyboard().instantiateViewControllerWithIdentifier(viewControllerIdentifier())
    }
    
    // Transitions

    class func performTransition(source: UIViewController)
    {
        source.presentViewController(viewControllerInstance(), animated: true, completion: nil)
    }

    class func performTransition(source: UIViewController, model: AnyObject?)
    {
        source.presentViewController(viewControllerInstance(), animated: true, completion: nil)
    }

    class func performTransition(source: UINavigationController)
    {
        source.pushViewController(viewControllerInstance(), animated: true)
    }

    class func performTransition(source: UINavigationController, model: AnyObject?)
    {
        source.pushViewController(viewControllerInstance(), animated: true)
    }
}