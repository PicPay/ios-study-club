//
//  ProfileFactory.swift
//  DojoApp
//
//  Created by jessicalewinter on 14/06/21.
//

import Foundation
import UIKit

enum ProfileFactory {
    static func make() -> UIViewController {
        let coordinator: ProfileCoordinating = ProfileCoordinator()
        let presenter: ProfilePresenting = ProfilePresenter(coordinator: coordinator)
        let interactor: ProfileInteracting = ProfileInteractor()
        let viewController = ProfileViewController(interactor: interactor)
        
        coordinator.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
}
