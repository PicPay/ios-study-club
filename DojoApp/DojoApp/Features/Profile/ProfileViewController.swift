//
//  ProfileViewController.swift
//  DojoApp
//
//  Created by jessicalewinter on 14/06/21.
//

import Foundation
import UIKit

protocol ProfileDisplaying: AnyObject {
    
}

final class ProfileViewController: UIViewController {
    private let interactor: ProfileInteracting
    
    init(interactor: ProfileInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController: ProfileDisplaying {
    
}
