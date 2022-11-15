//
//  UserSettingsViewController.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/25.
//

import UIKit

class UserSettingsViewController: UIViewController {

    static let storyboardName = "UserSettingsViewController"
    static let storyboardID = "UserSettingsViewControllerID"
    
    private var viewModel: UserSettingsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with viewModel: UserSettingsViewModel) -> UserSettingsViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? UserSettingsViewController else { return UserSettingsViewController() }
        viewController.viewModel = viewModel
        return viewController
    }
    
}
