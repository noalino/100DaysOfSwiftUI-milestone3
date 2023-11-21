//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by Noalino on 21/11/2023.
//

import SwiftUI

struct HabitDetailView: View {
    @Binding var habit: Habit

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(habit.description)
            Divider()
            Text("Completed \(habit.completionCount) times!")
            Button("Complete task") {
                habit.completionCount += 1
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    let habit = Habit(title: "test", description: "desc")
    return HabitDetailView(habit: .constant(habit))
}
