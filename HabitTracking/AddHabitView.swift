//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Noalino on 20/11/2023.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @Binding var habits: [Habit]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add a new habit")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                Button("Save") {
                    let newHabit = Habit(title: title, description: description)
                    habits.append(newHabit)
                    dismiss()
                }
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let habits = Habits()
    return AddHabitView(habits: .constant(habits.items))
}
