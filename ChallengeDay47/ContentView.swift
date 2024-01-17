//
//  ContentView.swift
//  ChallengeDay47
//
//  Created by Kirill Baranov on 17/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var pathStore = PathStore()
    @State var activityVM = ActivityVM()
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            List {
                ForEach (activityVM.activities) { activity in
                    NavigationLink(activity.name, value: activity)
                }
                .onDelete(perform: activityVM.deleteItems)
                
                .onMove(perform: activityVM.moveItems)
            }
            .navigationDestination(for: Activity.self) { activity in
                CurrentActivityView(activityVM: activityVM, activityID: activity.id)
            }
            .navigationTitle("My Activities")
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .fullScreenCover(isPresented: $isPresented, content: {
                NewActivityView(path: $pathStore.path, activityVM: activityVM)
            })
        }
    }
    
}

#Preview {
    ContentView()
}
