import Foundation
import UIKit

final class UserHeaderView: UIView {
    private lazy var userImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Name Label"
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Username Label"
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, usernameLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var userInfoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userImage, labelStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 8
        label.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        label.text = "User status"
        return label
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Programmer and a movie buff"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserHeaderView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(userInfoStackView)
        addSubview(statusLabel)
        addSubview(bioLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            userInfoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userInfoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.userInfoStackView.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 10),
            bioLabel.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: self.statusLabel.trailingAnchor)
        ])
    }
    
    
}
