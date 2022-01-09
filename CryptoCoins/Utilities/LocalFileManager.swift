//
//  LocalFileManager.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 09.01.2022.
//

import Foundation
import SwiftUI


class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    // MARK: - saveImage
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // create folder
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        // save image for path
        do {
            try data.write(to: url)
        } catch let error {
            print("⚠️ Error saving image. 💾 Image name: \(imageName) \(error.localizedDescription)")
        }
        
    }
    
    // MARK: - getImage
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
                  return nil
              }
        return UIImage(contentsOfFile: url.path)
    }
    
    // MARK: - createFolderIfNeeded
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("⚠️ Error creating directory. Folder Name: \(folderName) \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - getURLForFolder
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    // MARK: - getURLForImage
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
