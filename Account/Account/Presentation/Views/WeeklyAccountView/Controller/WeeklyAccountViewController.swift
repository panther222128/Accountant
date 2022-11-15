//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import UIKit

class WeeklyAccountViewController: UIViewController {
    
    @IBOutlet weak var presentButton: UIButton!
    
    static let storyboardName = "WeeklyAccountViewController"
    static let storyboardID = "WeeklyAccountViewControllerID"
    
    private var weeklyAccountViewModel: WeeklyAccountViewModel!
    private var pushAccountWriterViewModel: PushAccountWriterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create(with weeklyAccountViewModel: WeeklyAccountViewModel, pushAccountWriterViewModel: PushAccountWriterViewModel) -> WeeklyAccountViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? WeeklyAccountViewController else { return WeeklyAccountViewController() }
        viewController.weeklyAccountViewModel = weeklyAccountViewModel
        viewController.pushAccountWriterViewModel = pushAccountWriterViewModel
        return viewController
    }
    
    @IBAction func presentButtonAction(_ sender: Any) {
        pushAccountWriterViewModel.didPressCreateAccountBookElementButton()
    }
    
}
