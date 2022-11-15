//
//  AssetViewController.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/26.
//

import UIKit

class AssetViewController: UIViewController {

    static let storyboardName = "AssetViewController"
    static let storyboardID = "AssetViewControllerID"
    
    private var viewModel: AssetViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with viewModel: AssetViewModel) -> AssetViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? AssetViewController else { return AssetViewController() }
        viewController.viewModel = viewModel
        return viewController
    }
    
}
