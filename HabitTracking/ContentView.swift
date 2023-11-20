//
//  ContentView.swift
//  HabitTracking
//
//  Created by Noalino on 19/11/2023.
//

import SwiftUI

@Observable
class Habits {
    var items = [Habit]() {
        didSet {
            if let encodedItems = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "Habits")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showingAddNewHabit = false

    var body: some View {
        NavigationStack {
            List {
                ForEach($habits.items) { $habit in
                    Text(habit.title)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button("Add habit", systemImage: "plus") {
                    showingAddNewHabit = true
                }
            }
            .navigationTitle("Habit Tracker")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingAddNewHabit) {
                AddHabitView(habits: $habits.items)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
