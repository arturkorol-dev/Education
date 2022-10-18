//
//  GFAlertVC.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 14.10.2022.
//

import UIKit

class GFAlertVC: UIViewController {
    //MARK: - Enum
    enum Layout {
        static let containerLeftPadding: CGFloat = 16
        static let containerRightPadding: CGFloat = -16
        static let titleLabelTopPadding: CGFloat = 16
        static let titleLabelLeftPadding: CGFloat = 16
        static let titleLabelRightPadding: CGFloat = -16
        static let messageLabelTopPadding: CGFloat = 16
        static let messageLabelLeftPadding: CGFloat = 16
        static let messageLabelRightPadding: CGFloat = -16
        static let okButtonTopPadding: CGFloat = 16
        static let okButtonLeftPadding: CGFloat = 16
        static let okButtonRightPadding: CGFloat = -16
        static let okButtonBottomPadding: CGFloat = -16
    }
    
    //MARK: - Properties
    
    var alertTitle: String?
    var alertMessage: String?
    var buttonTitle: String?
    
    //MARK: - View
    
    private var _containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Label
    
    private var _titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    private var _messageLabel = GFBodyLabel(textAlignment: .center)
    
    //MARK: - Button
    
    private var _okButton = GFButton(title: "Ok", backgroundColor: .systemPink)
    
    //MARK: - Initialisation
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        _layout()
        _configure()
    }
    
    //MARK: - Layout
    
    private func _layout() {
        _makeLayoutForContainerView()
        _makeLayoutForTitleLabel()
        _makeLayoutForMessageLabel()
        _makeLayoutForOkButton()
    }
    
    private func _makeLayoutForContainerView() {
        view.addSubview(_containerView)
        NSLayoutConstraint.activate([
            _containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            _containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            _containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Layout.containerLeftPadding),
            _containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Layout.containerRightPadding)
        ])
    }
    
    private func _makeLayoutForTitleLabel() {
        _containerView.addSubview(_titleLabel)
        NSLayoutConstraint.activate([
            _titleLabel.topAnchor.constraint(equalTo: _containerView.topAnchor, constant: Layout.titleLabelTopPadding),
            _titleLabel.leadingAnchor.constraint(equalTo: _containerView.leadingAnchor, constant: Layout.titleLabelLeftPadding),
            _titleLabel.trailingAnchor.constraint(equalTo: _containerView.trailingAnchor, constant: Layout.titleLabelRightPadding)
        ])
    }
    
    private func _makeLayoutForMessageLabel() {
        _containerView.addSubview(_messageLabel)
        NSLayoutConstraint.activate([
            _messageLabel.topAnchor.constraint(equalTo: _titleLabel.bottomAnchor, constant: Layout.messageLabelTopPadding),
            _messageLabel.leadingAnchor.constraint(equalTo: _containerView.leadingAnchor, constant: Layout.messageLabelLeftPadding),
            _messageLabel.trailingAnchor.constraint(equalTo: _containerView.trailingAnchor, constant: Layout.messageLabelRightPadding)
        ])
    }
    
    private func _makeLayoutForOkButton() {
        _containerView.addSubview(_okButton)
        NSLayoutConstraint.activate([
            _okButton.topAnchor.constraint(equalTo: _messageLabel.bottomAnchor, constant: Layout.okButtonTopPadding),
            _okButton.leadingAnchor.constraint(equalTo: _containerView.leadingAnchor, constant: Layout.okButtonLeftPadding),
            _okButton.trailingAnchor.constraint(equalTo: _containerView.trailingAnchor, constant: Layout.okButtonRightPadding),
            _okButton.bottomAnchor.constraint(equalTo: _containerView.bottomAnchor, constant: Layout.okButtonBottomPadding)
        ])
    }
    
    //MARK: - Private Methods
    
    private func _configure() {
        _configureElements()
    }
    
    private func _configureElements() {
        // okButton
        _okButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        _okButton.addTarget(self, action: #selector(_dismissButtonAction), for: .touchUpInside)
        
        // titleLabel
        _titleLabel.text = alertTitle ?? "Oppps"
        
        //alertMessage
        _messageLabel.text = alertMessage ?? "Something went wrong"
    }
    
    //MARK: - Objc Method
    
    @objc private func _dismissButtonAction() {
        dismiss(animated: true)
    }
}
