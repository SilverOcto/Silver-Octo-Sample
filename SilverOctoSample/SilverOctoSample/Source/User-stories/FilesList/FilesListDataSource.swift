//
//  FilesListDataSource.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 26/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import UIKit
import SwiftyDropbox

@objc protocol FilesListDataSourceDelegate: class
{
    func didSelectFile(indexPath: NSIndexPath, path: String, name: String)
    
    func didSelectDirectory(indexPath: NSIndexPath, path: String, name: String)
}

class FilesListDataSource : NSObject, UITableViewDataSource, UITableViewDelegate
{
    private var tableView: UITableView!
    private var items = Array<Files.Metadata>()
    private weak var delegate: FilesListDataSourceDelegate?
    
    init(tableView: UITableView!, delegate: FilesListDataSourceDelegate)
    {
        super.init()
        
        self.delegate = delegate
        
        registerCells(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 44
        self.tableView = tableView
    }
    
    func registerCells(tableView:UITableView!)
    {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    func updateSource(newItems: [Files.Metadata]?, clean: Bool)
    {
        if clean
        {
            items.removeAll()
        }
        
        if let newItems = newItems
        {
            items.appendContentsOf(newItems)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as UITableViewCell!
        
        let file = items[indexPath.row]
    
        cell.imageView?.image = UIImage(named: cellImage(file))

        cell.textLabel?.text = file.name
        cell.textLabel?.font = UIFont.systemFontOfSize(16)
        cell.textLabel?.textColor = UIColor(red: 3/255, green: 3/255, blue: 3/255, alpha: 1)
        cell.accessoryType = .DisclosureIndicator
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let file = items[indexPath.row]
        if DropboxHelper.fileType(file) == .Directory
        {
            delegate?.didSelectDirectory(indexPath, path: file.pathLower, name: file.name)
        }
        else
        {
            delegate?.didSelectFile(indexPath, path: file.pathLower, name: file.name)
        }
    }
}

private extension FilesListDataSource
{
    func cellImage(file:Files.Metadata) -> String
    {
        switch DropboxHelper.fileType(file)
        {
        case .Audio: return "AudioFileIcon"
        case .Video: return "VideoFileIcon"
        case .Picture: return "PictureIcon"
        case .Document: return "DocumentFileIcon"
        case .Archive: return "ArchiveIcon"
        case .Directory: return "FolderIcon"
        case .Unknown: return "UnknownFileIcon"
        }
    }
}