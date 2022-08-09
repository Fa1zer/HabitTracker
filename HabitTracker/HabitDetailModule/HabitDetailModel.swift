//
//  HabitDetailModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 08.08.2022.
//

import Foundation

final class HabitDetailModel {
    
    let habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    var dates: [Date] { HabitsStore.shared.dates }
    
    func trackDateString(forIndex index: Int) -> String? {
        return HabitsStore.shared.trackDateString(forIndex: index)
    }
    
    func habit(_ habit: Habit, isTrackedIn date: Date) -> Bool {
        return HabitsStore.shared.habit(habit, isTrackedIn: date)
    }
    
}
