//
//  NewActivityView.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import SwiftUI

struct NewActivityView: View {
    
    @Environment(\.dismiss) var dismiss

    @Binding var path: NavigationPath
    
    @Bindable var activityVM: ActivityVM
    
    @State private var activity = Activity(
        id: UUID(),
        name: "",
        completedCounter: 0)
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("New Activity", text: $activity.name, prompt: Text("Write activity name"))
                VStack(alignment: .leading) {
                    Stepper("Completed \(activity.completedCounter) times", value: $activity.completedCounter)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        activityVM.activities.append(activity)
                        dismiss()
                        path = NavigationPath([activity])
                    }
                    .disabled(activity.name == "")
                }
            }
            .navigationTitle("Add New Activity")
        }
    }
}
