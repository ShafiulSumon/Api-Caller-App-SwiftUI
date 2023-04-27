//
//  CacheManager.swift
//  API-Caller-SwiftUI
//
//  Created by ShafiulAlam-00058 on 4/3/23.
//

import Foundation
import UIKit

class CacheManager {
    static let shared = CacheManager()
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    func get(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
}
