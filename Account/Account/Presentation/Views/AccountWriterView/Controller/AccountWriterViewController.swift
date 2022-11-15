//
//  AccountBookElementViewController.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/05.
//

import UIKit

class AccountWriterViewController: UIViewController {
    
    @IBOutlet weak var crudTestButton: UIButton!
    
    static let storyboardName = "AccountWriterViewController"
    static let storyboardID = "AccountWriterViewControllerID"
    
    private var accountBookElementViewModel: AccountBookElementViewModel!
    private var accountWriterViewModel: AccountWriterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with accountBookElementViewModel: AccountBookElementViewModel, accountWriterViewModel: AccountWriterViewModel) -> AccountWriterViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? AccountWriterViewController else { return AccountWriterViewController() }
        viewController.accountBookElementViewModel = accountBookElementViewModel
        viewController.accountWriterViewModel = accountWriterViewModel
        return viewController
    }
    
    @IBAction func crudTestButtonAction(_ sender: Any) {
        
    }
    
}
