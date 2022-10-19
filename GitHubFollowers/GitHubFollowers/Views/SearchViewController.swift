//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 08.10.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - Properties
    
    private var isUserNameEntered: Bool {
        return !userNameTextField.text!.isEmpty
    }
    
    //MARK: - UIImageView
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gh-logo")
        
        return image
    }()
    
    //MARK: - UITextField
    
    private let userNameTextField = GFTextField()
    
    //MARK: - UIButton
    
    private let searchButton = GFButton(title: "Get rollovers", backgroundColor: .systemGreen)
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Layout
    
    private func layout() {
        view.backgroundColor = .systemBackground
        makeLayoutForLogo()
        makeLayoutForTextField()
        makeLayoutForSearchButton()
    }
    
    private func makeLayoutForLogo() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func makeLayoutForTextField() {
        view.addSubview(userNameTextField)
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func makeLayoutForSearchButton() {
        view.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - Private methods
    
    private func configure() {
        userNameTextField.delegate = self
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        dismissKeyboardTabGesture()
    }
    
    private func dismissKeyboardTabGesture() {
        let tab = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tab)
    }
    
   @objc private func searchButtonPressed() {
       guard isUserNameEntered else {
           presentGFAlertOnMainThread(title: "Oppps", message: "You forgot enter user name", buttonTitle: "Ok")
           return
       }
       ///Navigation
        let followersVC = FollowerListViewController()
        followersVC.userName = userNameTextField.text
        followersVC.title = userNameTextField.text
        navigationController?.pushViewController(followersVC, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchButtonPressed()
        return true
    }
}
