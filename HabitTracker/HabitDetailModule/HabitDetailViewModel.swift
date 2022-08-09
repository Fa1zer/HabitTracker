//
//  HabitDetailViewModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 08.08.2022.
//

import Foundation

final class HabitDetailViewModel: HabitsCoordinatable {
    
    var coordinatorDelegate: HabitsCoordinator?
    private let model: HabitDetailModel
    
    init(model: HabitDetailModel) {
        self.model = model
    }
    
    private(set) lazy var habit = self.model.habit
    var dates: [Date] { self.model.dates }
    
    func goToEdit() {
        self.coordinatorDelegate?.goToHabitEdit(mode: .edit, habit: self.habit)
    }
    
    func trackDateString(forIndex index: Int) -> String? {
        return self.model.trackDateString(forIndex: index)
    }
    
    func habit(_ habit: Habit, isTrackedIn date: Date) -> Bool {
        return self.model.habit(habit, isTrackedIn: date)
    }
    
}
