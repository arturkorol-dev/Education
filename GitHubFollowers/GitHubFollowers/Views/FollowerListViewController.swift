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
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true 
    }
}
