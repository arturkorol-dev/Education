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
}
