//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation

final class HabitsViewModel: HabitsCoordinatable {
    
    var coordinatorDelegate: HabitsCoordinator?
    private let model: HabitsModel
    
    init(model: HabitsModel) {
        self.model = model
    }
    
    var habits: [Habit] { self.model.habits }
    var todayProgress: Float { self.model.todayProgress }
    
    func goToHabitEdit(mode: HabitEditMode, habit: Habit = Habit(name: "", date: Date(), color: .prettyPurple)) {
        self.coordinatorDelegate?.goToHabitEdit(mode: mode, habit: habit)
    }
    
    func goToHabitDetail(habit: Habit) {
        self.coordinatorDelegate?.goToHabitDetail(habit: habit)
    }
    
    func trackHabit(_ habit: Habit) {
        self.model.trackHaibt(habit)
    }
    
}
