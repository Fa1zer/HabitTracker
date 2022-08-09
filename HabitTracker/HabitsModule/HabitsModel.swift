//
//  HabitsModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import Foundation

final class HabitsModel {
    
    var habits: [Habit] { HabitsStore.shared.habits }
    var todayProgress: Float { HabitsStore.shared.todayProgress }
    
    func trackHaibt(_ habit: Habit) {
        HabitsStore.shared.track(habit)
    }
    
}
