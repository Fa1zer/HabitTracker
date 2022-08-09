//
//  InformationViewModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation

final class InformationViewModel: InformationCoordinatable {
    
    private let model: InformationModel
    var coordinatorDelegate: InformationCoordinator?
    
    init(model: InformationModel) {
        self.model = model
    }
    
}
