//
//  ViewFlowCoordinator.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import UIKit

protocol ViewFlowCoordinatorDependencies {
    func makeTabBarController() -> UITabBarController
    func makeMonthlyAccountViewController(action: MonthlyAccountViewModelAction, pushAccountWriterViewModelAction: PushAccountWriterViewModelAction) -> MonthlyAccountViewController
    func makeWeeklyAccountViewController(action: WeekyAccountViewModelAction, pushAccountWriterViewModelAction: PushAccountWriterViewModelAction) -> WeeklyAccountViewController
    func makeDailyAccountViewController(action: DailyAccountViewModelAction, pushAccountWriterViewModelAction: PushAccountWriterViewModelAction) -> DailyAccountViewController
    func makeAssetViewController() -> AssetViewController
    func makeUserSettingsViewController() -> UserSettingsViewController
    func makeAccountWriterViewController() -> AccountWriterViewController
}

final class ViewFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private weak var tabBarController: UITabBarController?
    private let dependencies: ViewFlowCoordinatorDependencies
    
    private weak var monthlyAccountViewController: MonthlyAccountViewController?
    private weak var weeklyAccountViewController: WeeklyAccountViewController?
    private weak var dailyAccountViewController: DailyAccountViewController?
    private weak var assetViewController: AssetViewController?
    private weak var userSettingsViewController: UserSettingsViewController?
    
    init(navigationController: UINavigationController, dependencies: ViewFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let tabBarController = dependencies.makeTabBarController()
        self.tabBarController = tabBarController
        
        let monthlyAccountViewModelAction = MonthlyAccountViewModelAction()
        let weeklyAccountViewModelAction = WeekyAccountViewModelAction()
        let dailyAccountViewModelAction = DailyAccountViewModelAction()
        
        let pushAccountWriterViewModelAction = PushAccountWriterViewModelAction(pushAccountWriterView: showAccountWriterView)
        
        let monthlyAccountViewController = dependencies.makeMonthlyAccountViewController(action: monthlyAccountViewModelAction, pushAccountWriterViewModelAction: pushAccountWriterViewModelAction)
        self.monthlyAccountViewController = monthlyAccountViewController
        
        let weeklyAccountViewController = dependencies.makeWeeklyAccountViewController(action: weeklyAccountViewModelAction, pushAccountWriterViewModelAction: pushAccountWriterViewModelAction)
        self.weeklyAccountViewController = weeklyAccountViewController
        
        let dailyAccountViewController = dependencies.makeDailyAccountViewController(action: dailyAccountViewModelAction, pushAccountWriterViewModelAction: pushAccountWriterViewModelAction)
        self.dailyAccountViewController = dailyAccountViewController
        
        let assetViewController = dependencies.makeAssetViewController()
        self.assetViewController = assetViewController
        
        let userSettingsViewController = dependencies.makeUserSettingsViewController()
        self.userSettingsViewController = userSettingsViewController
        
        self.tabBarController?.tabBar.tintColor = .black
        self.tabBarController?.tabBar.unselectedItemTintColor = .black
        
        let firstItem = UITabBarItem(title: "", image: Constants.TabBarImage.month, tag: 0)
        let secondItem = UITabBarItem(title: "", image: Constants.TabBarImage.week, tag: 1)
        let thirdItem = UITabBarItem(title: "", image: Constants.TabBarImage.day, tag: 2)
        let fourthItem = UITabBarItem(title: "", image: Constants.TabBarImage.asset, tag: 3)
        let fifthItem = UITabBarItem(title: "", image: Constants.TabBarImage.settings, tag: 4)
        
        monthlyAccountViewController.tabBarItem = firstItem
        weeklyAccountViewController.tabBarItem = secondItem
        dailyAccountViewController.tabBarItem = thirdItem
        assetViewController.tabBarItem = fourthItem
        userSettingsViewController.tabBarItem = fifthItem
        
        guard let selectedMonth = Constants.TabBarImage.selectedMonth else { return }
        guard let selectedWeek = Constants.TabBarImage.selectedWeek else { return }
        guard let selectedDay = Constants.TabBarImage.selectedDay else { return }
        guard let selectedAsset = Constants.TabBarImage.selectedAsset else { return }
        guard let selectedSettings = Constants.TabBarImage.selectedSettings else { return }
         
        
        firstItem.selectedImage = selectedMonth
        secondItem.selectedImage = selectedWeek
        thirdItem.selectedImage = selectedDay
        fourthItem.selectedImage = selectedAsset
        fifthItem.selectedImage = selectedSettings
        
        self.tabBarController?.viewControllers = [monthlyAccountViewController, weeklyAccountViewController, dailyAccountViewController, assetViewController, userSettingsViewController]
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    func showAccountWriterView() {
        let viewController = dependencies.makeAccountWriterViewController()
        monthlyAccountViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
