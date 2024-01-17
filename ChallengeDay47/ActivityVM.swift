//
//  ActivityVM.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
class ActivityVM {
    var activities: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decoded
                return
            }
        }
        activities = []
    }
    
    func deleteItems(indexSet: IndexSet) {
        for index in indexSet {
            activities.remove(at: index)
        }
    }
    
    func moveItems(indices: IndexSet, newOffset: Int) {
        withAnimation {
            activities.move(fromOffsets: indices, toOffset: newOffset)
        }
    }
}
