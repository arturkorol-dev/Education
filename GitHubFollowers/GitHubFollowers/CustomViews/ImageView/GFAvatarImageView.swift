//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 29.10.2022.
//

import UIKit

class GFAvatarImageView: UIImageView {

    //MARK: - UIImage
    
    private let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    //MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(with url: String) {
        let cache = NetworkingManager.shared.cache
        let objectKey = NSString(string: url)
        
        if let image = cache.object(forKey: objectKey) {
            self.image = image
            return
        }
        
        guard let urlString = URL(string: url) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: urlString) {[weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            cache.setObject(image, forKey: objectKey)
            
            DispatchQueue.main.async { self.image = image }
        }
        
        dataTask.resume()
    }
}
