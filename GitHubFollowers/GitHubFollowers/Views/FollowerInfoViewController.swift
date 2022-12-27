//
//  FollowerInfoViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 17.12.2022.
//

import UIKit

class FollowerInfoViewController: UIViewController {

    //MARK: - Enum
    
    enum Layout {
        static let viewTopPadding: CGFloat = 20
        static let viewLeftPadding: CGFloat = 20
        static let viewRightPadding: CGFloat = -20
        static let headerViewHeight: CGFloat = 180
        static let itemViewHeight: CGFloat = 140
    }
    
    //MARK: - View
    
    private let _headerView = UIView()
    private let _firstInfoView = UIView()
    private let _secondInfoView = UIView()
    
    //MARK: - Properties
    
    var followerName: String!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _layout()
        _configure()
    }
    
    //MARK: - Layout
    /// Layout for current View Controller.
    ///
    private func _layout() {
        let viewArray = [_headerView, _firstInfoView, _secondInfoView]
        
        for itemView in viewArray {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Layout.viewLeftPadding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Layout.viewRightPadding)
            ])
        }
        
        NSLayoutConstraint.activate([
            _headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            _headerView.heightAnchor.constraint(equalToConstant: Layout.headerViewHeight),
            
            _firstInfoView.topAnchor.constraint(equalTo: _headerView.bottomAnchor, constant: Layout.viewTopPadding),
            _firstInfoView.heightAnchor.constraint(equalToConstant: Layout.itemViewHeight),
            
            _secondInfoView.topAnchor.constraint(equalTo: _firstInfoView.bottomAnchor, constant: Layout.viewTopPadding),
            _secondInfoView.heightAnchor.constraint(equalToConstant: Layout.itemViewHeight),
        ])
    }

    //MARK: - Private methods
    /// Configure all methods on View Controller.
    ///
    private func _configure() {
        _firstInfoView.backgroundColor = .systemPink
        _secondInfoView.backgroundColor = .systemBlue
        _makeRequest()
        _setupViewController()
    }
    
    /// Setup View Controller
    ///
    private func _setupViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(_dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    /// Dismiss View Controller
    ///
    @objc private func _dismissVC() {
        dismiss(animated: true)
    }
    
    /// Make request to get user profile data
    ///
    private func _makeRequest() {
        NetworkingManager.shared.getFollowerInfo(for: followerName) {[weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self._addViewController(GFUserInfoHeaderViewController(user: user), to: self._headerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    private func _addViewController(_ childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
