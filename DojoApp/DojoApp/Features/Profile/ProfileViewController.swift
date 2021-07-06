//
//  ProfileViewController.swift
//  DojoApp
//
//  Created by jessicalewinter on 14/06/21.
//

import Foundation
import UIKit

protocol ProfileDisplaying: AnyObject {
    func displayNavigationBarButton()
}

final class ProfileViewController: UIViewController {
    private let interactor: ProfileInteracting
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(interactor: ProfileInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        displayNavigationBarButton()
    }
}

extension ProfileViewController: ProfileDisplaying {
    func displayNavigationBarButton() {
        let configButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(didTapConfigButton))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapConfigButton))
        navigationItem.rightBarButtonItems = [shareButton, configButton]
    }
}

private extension ProfileViewController {
    @objc
    func didTapConfigButton() {
        print(#function)
    }
    
    @objc
    func didTapShareButton() {
        print(#function)
    }
}

extension ProfileViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UserHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
