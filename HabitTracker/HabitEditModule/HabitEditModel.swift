//
//  HabitEditModel.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 09.08.2022.
//

import Foundation

final class HabitEditModel {
    
    var habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    func createHabit() {
        HabitsStore.shared.habits.append(self.habit)
    }
    
    func editHabit() {
        for i in 0 ..< HabitsStore.shared.habits.count {
            if HabitsStore.shared.habits[i].id == self.habit.id {
                HabitsStore.shared.habits[i] = self.habit
                
                break
            }
        }
    }
    
    func removeHabit() {
        for i in 0 ..< HabitsStore.shared.habits.count {
            if HabitsStore.shared.habits[i].id == self.habit.id {
                HabitsStore.shared.habits.remove(at: i)
                
                break
            }
        }
    }
    
}
