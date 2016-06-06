//
//  FilesListViewModel.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 26/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import Foundation
import SwiftyDropbox

@objc protocol FilesListViewModelDelegate: class
{
    func didSelectFile(indexPath: NSIndexPath, path: String, name: String)
    
    func didSelectDirectory(indexPath: NSIndexPath, path: String, name: String)
}

class FilesListViewModel
{
    private var dataSource: FilesListDataSource!
    private var currentDirectoryPath: String = ""
    
    private weak var delegate: FilesListViewModelDelegate?
    init(tableView: UITableView!, path:String = "", delegate: FilesListViewModelDelegate)
    {
        dataSource = FilesListDataSource(tableView: tableView, delegate: self)
        
        self.delegate = delegate
        currentDirectoryPath = path
        loadNexPage(currentDirectoryPath)
    }

    func loadNexPage(directoryPath: String)
    {
        // Verify user is logged into Dropbox
        if let client = Dropbox.authorizedClient
        {
            // List folder
            client.files.listFolder(path: directoryPath, includeMediaInfo: true).response { response, error in
                print("*** List folder ***")
                if let result = response
                {
                    print("Folder contents:")
                    self.dataSource.updateSource(result.entries, clean: false)
                }
                else
                {
                    print(error!)
                }
            }
        }
    }
}

extension FilesListViewModel: FilesListDataSourceDelegate
{
    @objc func didSelectFile(indexPath: NSIndexPath, path: String, name: String) {
        delegate?.didSelectFile(indexPath, path: path, name: name)
    }

    @objc func didSelectDirectory(indexPath: NSIndexPath, path: String, name: String) {
        delegate?.didSelectDirectory(indexPath, path: path, name: name)
    }
}