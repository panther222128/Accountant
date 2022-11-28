//
//  AccountBookElementViewController.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/05.
//

import UIKit

class AccountWriterViewController: UIViewController {
    
    @IBOutlet weak var accountBookElementCategoryCollectionView: UICollectionView!
    @IBOutlet weak var numpadCollectionView: UICollectionView!
    
    static let storyboardName = "AccountWriterViewController"
    static let storyboardID = "AccountWriterViewControllerID"
    
    private var accountBookElementViewModel: AccountBookElementViewModel!
    private var accountWriterViewModel: AccountWriterViewModel!
    private var numpadAdapter: NumpadAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numpadAdapter = NumpadAdapter(collectionView: numpadCollectionView, numpadDataSource: accountWriterViewModel, numpadDelegate: self)
        bind()
    }
    
    func bind() {
        accountWriterViewModel.inputText.bind { [weak self] text in
            
        }
    }
    
    static func create(with accountBookElementViewModel: AccountBookElementViewModel, accountWriterViewModel: AccountWriterViewModel) -> AccountWriterViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? AccountWriterViewController else { return AccountWriterViewController() }
        viewController.accountBookElementViewModel = accountBookElementViewModel
        viewController.accountWriterViewModel = accountWriterViewModel
        return viewController
    }
    
}

extension AccountWriterViewController: NumpadDelegate {
    func selectKey(at indexPath: IndexPath) {
        accountWriterViewModel.didSelectNumpadKey(at: indexPath.row)
    }
}
