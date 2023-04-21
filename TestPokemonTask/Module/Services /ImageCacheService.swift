//
//  ImageCacheService.swift
//  TestPokemonTask
//
//  Created by Alexander Pavlovets on 21.04.2023.
//

import UIKit

final class ImageCacheService {
    let shared = ImageCacheService()
    
    private let cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 50
        cache.totalCostLimit = 200 * 1024 * 1024
        return cache
    }()
    
    func save(url: String?, image: UIImage?) {
        guard let url = url else { return }
        guard let image = image else { return }
        
        self.cache.setObject(image, forKey: NSString(string: url))
        
    }
    
    func read(url: String?) -> UIImage? {
        if let url = url {
            let image = self.cache.object(forKey: NSString(string: url))
            return image
        } else {
            return nil
        }
    }
}
