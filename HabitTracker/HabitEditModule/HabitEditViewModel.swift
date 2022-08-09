//
//  HabitEditViewModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 09.08.2022.
//

import Foundation

final class HabitEditViewModel: HabitsCoordinatable {
    
    var coordinatorDelegate: HabitsCoordinator?
    private let model: HabitEditModel
    let mode: HabitEditMode
    
    init(model: HabitEditModel, mode: HabitEditMode) {
        self.model = model
        self.mode = mode
    }
    
    lazy var habit = self.model.habit {
        didSet {
            if self.habit != self.model.habit {
                self.model.habit = self.habit
            }
        }
    }
    
    func habitSave() {
        if self.mode == .edit {
            self.model.editHabit()
        } else {
            self.model.createHabit()
        }
    }
    
    func removeHabit() {
        self.model.removeHabit()
    }
    
    func goToHabits() {
        self.coordinatorDelegate?.goToHabits()
    }
    
}
