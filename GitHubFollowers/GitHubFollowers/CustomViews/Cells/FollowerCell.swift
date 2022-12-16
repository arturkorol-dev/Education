//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 29.10.2022.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    enum Layout {
        static let avatarImageTopPadding: CGFloat = 8
        static let avatarImageLeftPadding: CGFloat = 8
        static let avatarImageRightPadding: CGFloat = -8
        static let userNameLabelTopPadding: CGFloat = 12
        static let userNameLabelLeftPadding: CGFloat = 8
        static let userNameLabelRightPadding: CGFloat = -8
    }
    
    enum Font {
        static let userNameFont: CGFloat = 16
    }
    
    //MARK: - Reusable Id
    ///Reuse Identifier
    static let reuseID = "FollowerCell"
    
    //MARK: - ImageView
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    
    //MARK: - Label
    
    let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: Font.userNameFont)
    
    //MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    private func layout() {
        addSubview(avatarImageView)
        addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Layout.avatarImageTopPadding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Layout.avatarImageLeftPadding),
            avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Layout.avatarImageRightPadding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Layout.userNameLabelTopPadding),
            userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Layout.userNameLabelLeftPadding),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Layout.userNameLabelRightPadding)
        ])
    }
    
    //MARK: - Methods
    
    func setFollowers(follower: Follower) {
        userNameLabel.text = follower.login
        avatarImageView.downloadImage(with: follower.avatarUrl)
    }
}
