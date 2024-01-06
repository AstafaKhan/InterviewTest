//
//  ImageManager.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 06/01/2024.
//

import UIKit

class ImageLoader {
    // Simple in-memory cache
    private var imageCache = [String: UIImage]()

    func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        // Check if the image is already in the cache
        if let cachedImage = imageCache[url.absoluteString] {
            completion(cachedImage)
            return
        }
        // Image is not in the cache, download it
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle errors
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            // Convert data to UIImage
            if let image = UIImage(data: data) {
                // Cache the image
                self.imageCache[url.absoluteString] = image
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

