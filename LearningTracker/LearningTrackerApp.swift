//
//  LearningTrackerApp.swift
//  LearningTracker
//
//  Created by YoonieMac on 12/27/25.
//

import SwiftUI

@main
struct LearningTrackerApp: App {
    
    @State private var tracker: StudyTracker = StudyTracker()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(tracker)
        }
    }
}
