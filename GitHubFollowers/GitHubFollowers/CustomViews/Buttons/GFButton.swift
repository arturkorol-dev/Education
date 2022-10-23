//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 10.10.2022.
//

import UIKit

class GFButton: UIButton {
    
    //MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private method
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
