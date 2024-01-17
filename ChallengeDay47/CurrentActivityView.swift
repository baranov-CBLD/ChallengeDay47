//
//  ActivityView.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import SwiftUI

struct CurrentActivityView: View {
    
    @Bindable var activityVM: ActivityVM
    
    let activityID: UUID
    var i: Int {
        if let result = activityVM.activities.firstIndex(where: { activityID == $0.id } ) {
            return result
        } else {
            fatalError("unable to find activity ID")
        }
    }
    
    var body: some View {
        Form {
            Stepper(
                "Activity counter: \(activityVM.activities[i].completedCounter)",
                value: $activityVM.activities[i].completedCounter
            )
        }
        .navigationTitle($activityVM.activities[i].name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let activityVM = ActivityVM()
    return CurrentActivityView(activityVM: activityVM, activityID: activityVM.activities[0].id)
}
