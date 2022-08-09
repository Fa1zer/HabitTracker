//
//  HabitsCoordinator.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation
import UIKit

protocol HabitsCoordinatable {
    var coordinatorDelegate: HabitsCoordinator? { get set }
}

final class HabitsCoordinator: Coordinator {
    
    var coordinatorDelegate: MainTabBarController?
    
    init() {
        self.setupViews()
    }
    
    private(set) var navigationController = UINavigationController()
    
    func start() {
        self.goToHabits()
    }
    
    func goToHabits() {
        let viewModel = HabitsViewModel(model: HabitsModel())
        let viewController = HabitsViewController(viewModel: viewModel)
        
        viewModel.coordinatorDelegate = self
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToHabitDetail(habit: Habit) {
        let model = HabitDetailModel(habit: habit)
        let viewModel = HabitDetailViewModel(model: model)
        let viewController = HabitDetailViewController(viewModel: viewModel)
        
        viewModel.coordinatorDelegate = self
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToHabitEdit(mode: HabitEditMode, habit: Habit) {
        let model = HabitEditModel(habit: habit)
        let viewModel = HabitEditViewModel(model: model, mode: mode)
        let viewController = HabitEditViewController(viewModel: viewModel)
        
        viewModel.coordinatorDelegate = self
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupViews() {
        self.navigationController.navigationBar.barTintColor = .white
        self.navigationController.navigationBar.shadowImage = UIImage()
        self.navigationController.tabBarItem = UITabBarItem(
            title: "Привычки",
            image: UIImage(named: "Shape"),
            selectedImage: UIImage(named: "Shape")
        )
    }
    
}
