//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 11.10.2022.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    //MARK: - Properties
    
    var userName: String!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    //MARK: - Private Methods
    
    private func config() {
        setupView()
        getFollowers()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getFollowers() {
        NetworkingManager.shared.getFollowers(for: userName, page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers.count)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Opps", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}
