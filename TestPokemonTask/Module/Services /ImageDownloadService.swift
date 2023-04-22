//
//  ImageDownloadService.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 19.04.2023.
//

import UIKit

final class ImageDownloadService {
    
    private var downloadTask: DispatchWorkItem?
    
    func load(_ url: URL?, completion: @escaping (UIImage) -> Void) {
        guard let url = url else { return }
        
        if let image = ImageCacheService.shared.read(url: url.absoluteString) {
            DispatchQueue.main.async {
                completion(image)
            }
        } else {
            let downloadTask = DispatchWorkItem(qos: .userInitiated, block: {
                if let data = try? Data(contentsOf: url),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        ImageCacheService.shared.save(url: url.absoluteString, image: image)
                        completion(image)
                    }
                }
            })
            DispatchQueue.global(qos: .userInitiated).async(execute: downloadTask)
            self.downloadTask = downloadTask
        }
    }
    
    func cancel() {
        downloadTask?.cancel()
        downloadTask = nil
    }
}
