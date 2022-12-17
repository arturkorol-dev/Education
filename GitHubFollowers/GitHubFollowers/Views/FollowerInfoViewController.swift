//
//  FollowerInfoViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 17.12.2022.
//

import UIKit

class FollowerInfoViewController: UIViewController {

    //MARK: - Properties
    
    var followerName: String!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configure()
    }
    
    //MARK: - Layout
    /// Layout for current View Controller.
    ///
    private func layout() {
        
    }

    //MARK: - Private methods
    /// Configure all methods on View Controller.
    ///
    private func configure() {
        setupViewController()
    }
    
    /// Setup View Controller
    ///
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    /// Dismiss View Controller
    ///
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
