//
//  ImageDownloadService.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

final class ImageDownloadService {
    
    //MARK: - Properties
    private var downloadTask: DispatchWorkItem?
    
    //MARK: - method
    func imageDownloadWithUrl(url: String, complition: @escaping(UIImage) -> Void) {
        let url = URL(string: url)
        
        guard let url = url else { return }
        
        let downloadTask = DispatchWorkItem(qos: .userInitiated) {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                        complition(image)
                    }
                }
        }
        
        DispatchQueue.global(qos: .userInitiated).async(execute: downloadTask)
        self.downloadTask = downloadTask
    }
    
    func cancel() {
        downloadTask?.cancel()
        downloadTask = nil
    }
}
