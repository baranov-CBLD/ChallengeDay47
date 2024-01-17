//
//  Activity.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import Foundation

struct Activity: Codable, Hashable, Identifiable {
    var id: UUID
    
    var name: String
    var completedCounter: Int {
        didSet {
            if completedCounter < 0 {
                completedCounter = 0
            }
        }
    }
}


