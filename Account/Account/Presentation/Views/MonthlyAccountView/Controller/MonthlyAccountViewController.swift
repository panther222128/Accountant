//
//  ViewController.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import UIKit

class MonthlyAccountViewController: UIViewController {

    @IBOutlet weak var presentButton: UIButton!
    
    static let storyboardName = "MonthlyAccountViewController"
    static let storyboardID = "MonthlyAccountViewControllerID"
    
    private var monthlyAccountViewModel: MonthlyAccountViewModel!
    private var pushAccountWriterViewModel: PushAccountWriterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with monthlyAccountViewModel: MonthlyAccountViewModel, pushAccountWriterViewModel: PushAccountWriterViewModel) -> MonthlyAccountViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? MonthlyAccountViewController else { return MonthlyAccountViewController() }
        viewController.monthlyAccountViewModel = monthlyAccountViewModel
        viewController.pushAccountWriterViewModel = pushAccountWriterViewModel
        return viewController
    }

    @IBAction func presentAction(_ sender: Any) {
        pushAccountWriterViewModel.didPressCreateAccountBookElementButton()
    }
    
}

