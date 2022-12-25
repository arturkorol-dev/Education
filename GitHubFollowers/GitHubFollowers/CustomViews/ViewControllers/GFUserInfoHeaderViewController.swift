//
//  GFUserInfoHeaderViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 24.12.2022.
//

import UIKit

class GFUserInfoHeaderViewController: UIViewController {
    
    //MARK: - Enum
    
    enum Layout {
        static let avatarImageTopPadding: CGFloat = 20
        static let avatarImageLeftPadding: CGFloat = 20
        static let avatarImageHeight: CGFloat = 90
        static let avatarImageWidh: CGFloat = 90
        static let userNameLabelLeftPadding: CGFloat = 12
        static let userNameLabelRightPadding: CGFloat = -12
        static let locationImageSize: CGSize = CGSize(width: 20, height: 20)
        static let bioLabelTopPadding: CGFloat = 12
        
    }
    
    //MARK: - Labels
    
    private let _userNameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    private let _nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    private let _locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    private let _bioLabel = GFBodyLabel(textAlignment: .left)
    
    //MARK: - ImageView
    
    private let _avatarImageView = GFAvatarImageView(frame: .zero)
    private let _locationImageView = UIImageView()
    
    var user: User!
    
    //MARK: - Init
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _layout()
        _configure()
    }

    //MARK: - Layout
    
    private func _layout() {
        view.addSubview(_avatarImageView)
        view.addSubview(_userNameLabel)
        view.addSubview(_nameLabel)
        view.addSubview(_locationImageView)
        view.addSubview(_locationLabel)
        view.addSubview(_bioLabel)
        
        NSLayoutConstraint.activate([
            _avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Layout.avatarImageTopPadding),
            _avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Layout.avatarImageLeftPadding),
            _avatarImageView.widthAnchor.constraint(equalToConstant: Layout.avatarImageHeight),
            _avatarImageView.heightAnchor.constraint(equalToConstant: Layout.avatarImageHeight),
            
            _userNameLabel.topAnchor.constraint(equalTo: _avatarImageView.topAnchor),
            _userNameLabel.leadingAnchor.constraint(equalTo: _avatarImageView.trailingAnchor, constant: Layout.userNameLabelLeftPadding),
            _userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Layout.userNameLabelRightPadding),
            
            _nameLabel.centerYAnchor.constraint(equalTo: _avatarImageView.centerYAnchor, constant: 8),
            _nameLabel.leadingAnchor.constraint(equalTo: _avatarImageView.trailingAnchor, constant: Layout.userNameLabelLeftPadding),
            _nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Layout.userNameLabelRightPadding),
            
            _locationImageView.bottomAnchor.constraint(equalTo: _avatarImageView.bottomAnchor),
            _locationImageView.leadingAnchor.constraint(equalTo: _avatarImageView.trailingAnchor, constant: Layout.userNameLabelLeftPadding),
            _locationImageView.widthAnchor.constraint(equalToConstant: Layout.locationImageSize.width),
            _locationImageView.heightAnchor.constraint(equalToConstant: Layout.locationImageSize.height),
            
            _locationLabel.centerYAnchor.constraint(equalTo: _locationImageView.centerYAnchor),
            _locationLabel.leadingAnchor.constraint(equalTo: _locationImageView.trailingAnchor),
            _locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Layout.userNameLabelRightPadding),
            
            _bioLabel.topAnchor.constraint(equalTo: _avatarImageView.bottomAnchor, constant: Layout.bioLabelTopPadding),
            _bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Layout.userNameLabelLeftPadding),
            _bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Layout.userNameLabelRightPadding)
        ])
    }
    
    private func _configure() {
        _avatarImageView.downloadImage(with: user.avatarUrl)
        _userNameLabel.text = user.login
        _nameLabel.text = user.name ?? ""
        _locationLabel.text = user.location ?? "No location"
        _bioLabel.text = user.bio ?? "Don't have bio"
        _bioLabel.numberOfLines = 3
        _locationImageView.translatesAutoresizingMaskIntoConstraints = false
        _locationImageView.image = UIImage(systemName: SFSymbol.locationImage)
    }
}
