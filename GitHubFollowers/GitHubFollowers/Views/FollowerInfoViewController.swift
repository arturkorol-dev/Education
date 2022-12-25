//
//  FollowerInfoViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 17.12.2022.
//

import UIKit

class FollowerInfoViewController: UIViewController {

    //MARK: - View
    
    private let _headerView = UIView()
    
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
        view.addSubview(_headerView)
        
        NSLayoutConstraint.activate([
            _headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            _headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            _headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            _headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    //MARK: - Private methods
    /// Configure all methods on View Controller.
    ///
    private func _configure() {
        _headerView.translatesAutoresizingMaskIntoConstraints = false
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
