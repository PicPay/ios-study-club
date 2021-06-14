//
//  ProfilePresenter.swift
//  DojoApp
//
//  Created by jessicalewinter on 14/06/21.
//

import Foundation

protocol ProfilePresenting: AnyObject {
    var viewController: ProfileDisplaying? { get set }
}

final class ProfilePresenter: ProfilePresenting {
    private let coordinator: ProfileCoordinating
    weak var viewController: ProfileDisplaying?
    
    init(coordinator: ProfileCoordinating) {
        self.coordinator = coordinator
    }
}
