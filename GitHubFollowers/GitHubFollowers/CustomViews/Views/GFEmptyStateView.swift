//
//  GFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 17.12.2022.
//

import UIKit

final class GFEmptyStateView: UIView {
    
    //MARK: - Label
    
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    
    //MARK: - ImageView
    
    let imageView = UIImageView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        layout()
        configure()
    }
    
    //MARK: - Layout
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            titleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -80),
            
            imageView.heightAnchor.constraint(equalToConstant: 500),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configure() {
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .secondaryLabel
        
        imageView.image =  UIImage(named: "empty-state-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
