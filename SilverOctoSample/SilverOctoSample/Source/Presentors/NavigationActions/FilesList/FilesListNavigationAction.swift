//
//  FilesListNavigationAction.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 25.03.16.
//  Copyright © 2016 Lenhador. All rights reserved.
//

import UIKit

class FilesListNavigationAction : NavigationAction
{
    override class func storyboardName() -> String
    {
        return "Main"
    }
    
    override class func viewControllerIdentifier() -> String
    {
        return "FilesListViewController"
    }
    
    override class func performTransition(source: UINavigationController, model: AnyObject?)
    {
        guard let filesListViewController = viewControllerInstance() as? FilesListViewController else {
            return
        }
        
        guard let directoryPath = model as? String else {
            return
        }
        
        filesListViewController.currentDirectoryPath = directoryPath
        
        source.pushViewController(filesListViewController, animated: true)
    }
}