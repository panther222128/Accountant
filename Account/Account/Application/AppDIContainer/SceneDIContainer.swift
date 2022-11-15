//
//  SceneDIContainer.swift
//  RealmPractice
//
//  Created by Jun Ho JANG on 2022/05/24.
//

import UIKit

final class SceneDIContainer: ViewFlowCoordinatorDependencies {
 
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private lazy var storage: Storage = DefaultStorage()
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeTabBarController() -> UITabBarController {
        return UITabBarController()
    }
    
    func makeViewFlowCoordinator(navigationController: UINavigationController) -> ViewFlowCoordinator {
        return ViewFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    func makeAccountBookElementRepository() -> AccountBookElementRepository {
        return DefaultAccountBookElementRepository(dataTransferService: dependencies.apiDataTransferService, storage: storage)
    }
    
    func makeAssetElementRepository() -> AssetElementRepository {
        return DefaultAssetElementRepository(dataTransferService: dependencies.apiDataTransferService, storage: storage)
    }
    
    func makeUserSettingsRepository() -> UserSettingsRepository {
        return DefaultUserSettingsRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    // MARK: - Push account writer view model
    
    func makePushAccountWriterViewModel(action: PushAccountWriterViewModelAction) -> PushAccountWriterViewModel {
        return DefaultPushAccountWriterViewModel(action: action)
    }
    
    // MARK: - Monthly account
    
    func makeMonthlyAccountUseCase() -> MonthlyAccountUseCase {
        return DefaultMonthlyAccountUseCase()
    }
    
    func makeMonthlyAccountViewModel(action: MonthlyAccountViewModelAction) -> MonthlyAccountViewModel {
        return DefaultMonthlyAccountViewModel(monthlyAccountUseCase: makeMonthlyAccountUseCase(), action: action)
    }
    
    func makeMonthlyAccountViewController(action: MonthlyAccountViewModelAction, pushAccountWriterViewModelAction: PushAccountWriterViewModelAction) -> MonthlyAccountViewController {
        return MonthlyAccountViewController.create(with: makeMonthlyAccountViewModel(action: action), pushAccountWriterViewModel: makePushAccountWriterViewModel(action: pushAccountWriterViewModelAction))
    }
    
    // MARK: - Weekly account
    
    func makeWeeklyAccountUseCase() -> WeeklyAccountUseCase {
        return DefaultWeeklyAccountUseCase()
    }
    
    func makeWeeklyAccountViewModel(action: WeekyAccountViewModelAction) -> WeeklyAccountViewModel {
        return DefaultWeeklyAccountViewModel(weeklyAccountUseCase: makeWeeklyAccountUseCase(), action: action)
    }
    
    func makeWeeklyAccountViewController(action: WeekyAccountViewModelAction, pushAccountWriterViewModelAction: PushAccountWriterViewModelAction) -> WeeklyAccountViewController {
        return WeeklyAccountViewController.create(with: makeWeeklyAccountViewModel(action: action), pushAccountWriterViewModel: makePushAccountWriterViewModel(action: pushAccountWriterViewModelAction))
    }
    
    // MARK: - Daily account
    
    func makeDailyAccountUseCase() -> DailyAccountUseCase {
        return DefaultDailyAccountUseCase()
    }
    
    func makeDailyAccountViewModel(action: DailyAccountViewModelAction) -> DailyAccountViewModel {
        return DefaultDailyAccountViewModel(dailyAccountUseCase: makeDailyAccountUseCase(), action: action)
    }
    
    func makeDailyAccountViewController(action: DailyAccountViewModelAction, pushAccountWriterViewModelAction: PushAccountWriterViewModelAction) -> DailyAccountViewController {
        return DailyAccountViewController.create(with: makeDailyAccountViewModel(action: action), pushAccountWriterViewModel: makePushAccountWriterViewModel(action: pushAccountWriterViewModelAction))
    }
    
    // MARK: - Asset
    
    func makeAssetUseCase() -> AssetElementUseCase {
        return DefaultAssetElementUseCase(assetElementRepository: makeAssetElementRepository())
    }
    
    func makeAssetViewModel() -> AssetViewModel {
        return DefaultAssetViewModel(assetUseCase: makeAssetUseCase())
    }
    
    func makeAssetViewController() -> AssetViewController {
        return AssetViewController.create(with: makeAssetViewModel())
    }
    
    // MARK: - User settings
    
    func makeUserSettingsUseCase() -> UserSettingsUseCase {
        return DefaultUserSettingsUseCase(userSettingsRepository: makeUserSettingsRepository())
    }
    
    func makeUserSettingsViewModel() -> UserSettingsViewModel {
        return DefaultUserSettingsViewModel(userSettingsUseCase: makeUserSettingsUseCase())
    }
    
    func makeUserSettingsViewController() -> UserSettingsViewController {
        return UserSettingsViewController.create(with: makeUserSettingsViewModel())
    }
    
    // MARK: - Account writer
    
    func makeAccountWriterUseCase() -> AccountWriterUseCase {
        return DefaultAccountWriterUseCase()
    }
    
    func makeAccountWriterViewModel() -> AccountWriterViewModel {
        return DefaultAccountWriterViewModel(accountWriterUseCase: makeAccountWriterUseCase())
    }
    
    func makeAccountWriterViewController() -> AccountWriterViewController {
        return AccountWriterViewController.create(with: makeAccountBookElementViewModel(), accountWriterViewModel: makeAccountWriterViewModel())
    }
    
    func makeAccountBookElementUseCase() -> AccountBookElementUseCase {
        return DefaultAccountBookElementUseCase(accountBookElementRepository: makeAccountBookElementRepository())
    }
    
    func makeAccountBookElementViewModel() -> AccountBookElementViewModel {
        return DefaultAccountBookElementViewModel(accountBookElementStorageUseCase: makeAccountBookElementUseCase())
    }
    
}
