//
//  PathStore.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
class PathStore {
    
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savedPath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savedPath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    private func save() {
        do {
            guard let representation = path.codable else { return }
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savedPath)
        } catch {
            print("Failed to save navigation data")
        }
    }
    
}
