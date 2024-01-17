//
//  ActivityView.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import SwiftUI

struct CurrentActivityView: View {
    
    @State var activities: Activities
    let activity: Activity
    var i: Int {
        if let result = activities.list.firstIndex(where: { activity.id == $0.id } ) {
            return result
        } else {
            fatalError("wrong activity")
        }
    }
    
    var body: some View {
        Form {
//        VStack(alignment: .leading) {
            Stepper(
                "Activity counter: \(activities.list[i].completedCounter)",
                value: $activities.list[i].completedCounter
            )
        }
        .navigationTitle($activities.list[i].name)
        .navigationBarTitleDisplayMode(.inline)
//        .padding()
    }
}

#Preview {
    let activities = Activities()
    return CurrentActivityView(activities: activities, activity: activities.list[0])
}
