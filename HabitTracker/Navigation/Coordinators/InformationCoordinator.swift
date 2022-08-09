//
//  InformationCoordinator.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation
import UIKit

protocol InformationCoordinatable {
    var coordinatorDelegate: InformationCoordinator? { get set }
}

final class InformationCoordinator: Coordinator {
    
    var coordinatorDelegate: MainTabBarController?
    
    init() {
        self.setupViews()
    }
    
    private(set) var navigationController = UINavigationController()
    
    func start() {
        self.goToInformation()
    }
    
    func goToInformation() {
        let viewModel = InformationViewModel(model: InformationModel())
        let viewController = InformationViewController(viewModel: viewModel)
        
        viewModel.coordinatorDelegate = self
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupViews() {
        self.navigationController.tabBarItem = UITabBarItem(
            title: "Информация",
            image: UIImage(systemName: "info.circle.fill"),
            selectedImage: UIImage(systemName: "info.circle.fill")
        )
    }
    
}
