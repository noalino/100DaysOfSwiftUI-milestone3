//
//  Habit.swift
//  HabitTracking
//
//  Created by Noalino on 20/11/2023.
//

import Foundation

struct Habit: Codable, Hashable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount = 0
}
