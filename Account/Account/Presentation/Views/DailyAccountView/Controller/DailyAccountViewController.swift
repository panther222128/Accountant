//
//  ThirdViewController.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import UIKit

class DailyAccountViewController: UIViewController {
    
    @IBOutlet weak var presentButton: UIButton!
    
    static let storyboardName = "DailyAccountViewController"
    static let storyboardID = "DailyAccountViewControllerID"
    
    private var dailyAccountViewModel: DailyAccountViewModel!
    private var pushAccountWriterViewModel: PushAccountWriterViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    static func create(with dailyAccountViewModel: DailyAccountViewModel, pushAccountWriterViewModel: PushAccountWriterViewModel) -> DailyAccountViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? DailyAccountViewController else { return DailyAccountViewController() }
        viewController.dailyAccountViewModel = dailyAccountViewModel
        viewController.pushAccountWriterViewModel = pushAccountWriterViewModel
        return viewController
    }
    
    @IBAction func presentButtonAction(_ sender: Any) {
        pushAccountWriterViewModel.didPressCreateAccountBookElementButton()
    }
    
}
