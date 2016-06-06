//
//  FilesListViewController.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 26/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import UIKit
import SwiftyDropbox

class FilesListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: FilesListViewModel!
    
    var currentDirectoryPath: String = ""
    var currentDirectoryName: String = "Dropbox"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = currentDirectoryName
        
        viewModel = FilesListViewModel(tableView: tableView, path: currentDirectoryPath, delegate: self)
    }
}

extension FilesListViewController: FilesListViewModelDelegate
{
    func didSelectDirectory(indexPath: NSIndexPath, path: String, name: String) {
        FilesListNavigationAction.performTransition(navigationController!, model: path)
    }
    
    func didSelectFile(indexPath: NSIndexPath, path: String, name: String) {
        FileProfileNavigationAction.performTransition(navigationController!, filePath: path, fileName: name)
    }
}