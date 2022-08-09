//
//  Coordinator.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation
import UIKit

protocol Coordinator: MainTabBarCoordinatable {
    
    var navigationController: UINavigationController { get }
    
    func start()
        
}
