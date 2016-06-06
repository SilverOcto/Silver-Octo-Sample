//
//  DropboxHelper.swift
//  SilverOctoSample
//
//  Created by Aleksandr Belov on 29/5/16.
//  Copyright © 2016 SilverOcto. All rights reserved.
//

import Foundation
import SwiftyDropbox

enum DBFileExtension {
    case Audio, Video, Picture, Document, Archive, Directory, Unknown
}

class DropboxHelper
{
    static func fileType(file: Files.Metadata?) -> DBFileExtension
    {
        guard let file = file else { return .Unknown }
        
        if file is Files.FolderMetadata {
            return .Directory
        }
        
        let fileName = file.name

        if fileName.hasSuffix(".jpg") || fileName.hasSuffix(".png") {
            return .Picture
        } else if fileName.hasSuffix(".mp3") {
            return .Audio
        } else if fileName.hasSuffix(".mp4") {
            return .Video
        } else if fileName.hasSuffix(".txt") ||
            fileName.hasSuffix(".pdf") ||
            fileName.hasSuffix(".rtf") ||
            fileName.hasSuffix(".doc") ||
            fileName.hasSuffix(".docs") {
            return .Document
        } else if fileName.hasSuffix(".zip") || fileName.hasSuffix(".rar") {
            return .Archive
        } else {
            return .Unknown
        }
    }
}