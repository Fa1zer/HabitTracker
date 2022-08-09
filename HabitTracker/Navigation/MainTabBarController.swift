//
//  MainTabBarController.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation
import UIKit

protocol MainTabBarCoordinatable {
    var coordinatorDelegate: MainTabBarController? { get set }
}

final class MainTabBarController: UITabBarController {
    
    private var habitsCoordinator: HabitsCoordinator {
        let coordinator = HabitsCoordinator()
        
        coordinator.coordinatorDelegate = self
        coordinator.start()
        
        return coordinator
    }
    
    private var informationCoordinator: InformationCoordinator {
        let coordinator = InformationCoordinator()
        
        coordinator.coordinatorDelegate = self
        coordinator.start()
        
        return coordinator
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupViews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
        self.viewControllers = [
            self.habitsCoordinator.navigationController,
            self.informationCoordinator.navigationController
        ]
    }
    
}
