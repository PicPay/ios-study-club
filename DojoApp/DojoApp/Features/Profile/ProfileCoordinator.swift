//
//  ProfileCoordinator.swift
//  DojoApp
//
//  Created by jessicalewinter on 14/06/21.
//

import Foundation
import UIKit

enum ProfileCoordinatorAction {
}

protocol ProfileCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
}

final class ProfileCoordinator: ProfileCoordinating {
    weak var viewController: UIViewController?
}
