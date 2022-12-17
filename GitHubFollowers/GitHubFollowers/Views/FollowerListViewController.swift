//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 11.10.2022.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    //MARK: - Enum
    
    enum Section { case main }
    
    //MARK: - Properties
    
    var userName: String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    var followers: [Follower] = []
    var page: Int = 1
    var hasMoreFollowers: Bool = true
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    //MARK: - Private Methods
    
    /// Call our methods when view did load.
    private func config() {
        setupView()
        getFollowers(for: userName, page: page)
        configureCollectionView()
        configureDataSource()
    }
    
    /// Set default values to the view.
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /// Get user data about his followers.
    ///
    /// - Parameters:
    ///     - userName: Our user name on git hub.
    ///     - page: Page number of a list.
    ///
    private func getFollowers(for userName: String, page: Int) {
        requestDidStart()
        NetworkingManager.shared.getFollowers(for: userName, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false}
                self.followers.append(contentsOf: followers)
                if self.followers.isEmpty {
                    let massage = "User don't have any followers😞"
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: massage, in: self.view)
                    }
                }
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Opps", message: error.rawValue, buttonTitle: "Ok")
            }
            self.requestDidEnd()
        }
    }
    
    /// Configure collection view.
    private func configureCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view)
        )
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    /// Configure Data Source.
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, follower in
                
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.setFollowers(follower: follower)
            return cell
        })
    }
    
    /// Update data for CollectionView.
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}

extension FollowerListViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            self.page += 1
            self.getFollowers(for: userName, page: page)
        }
    }
}
