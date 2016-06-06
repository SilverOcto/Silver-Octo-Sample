//
//  FileProfileNavigationAction.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 28/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import UIKit
import SwiftyDropbox

class FileProfileNavigationAction : NavigationAction
{
    override class func storyboardName() -> String
    {
        return "Main"
    }
    
    override class func viewControllerIdentifier() -> String
    {
        return "FileProfileViewController"
    }
    
    class func performTransition(source: UINavigationController, filePath: String, fileName: String)
    {
        guard let fileProfileViewController = viewControllerInstance() as? FileProfileViewController else {
            return
        }
        
        fileProfileViewController.fileName = fileName
        fileProfileViewController.filePath = filePath
        
        source.pushViewController(fileProfileViewController, animated: true)
    }
}