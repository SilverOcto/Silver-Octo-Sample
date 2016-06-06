//
//  FileProfileViewController.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 28/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import UIKit
import SwiftyDropbox

class FileProfileViewController: UIViewController
{
    var filePath: String = ""
    var fileName: String = ""
    
    private var viewModel: FileProfileViewModel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = fileName
        
        viewModel = FileProfileViewModel()
    }
}