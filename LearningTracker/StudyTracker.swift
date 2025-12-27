//
//  ViewModel.swift
//  LearningTracker
//
//  Created by YoonieMac on 12/27/25.
//

import Foundation

@Observable
class StudyTracker {
    var sessions: [StudySession] = []
    
    var totalHours: Double {
        return sessions.map { $0.hours }.reduce(0, +)
    }
    
    func addSession(session: StudySession) {
        if let index = sessions.firstIndex(where: { $0.subject == session.subject }) {
            sessions[index].hours += session.hours
        } else {
            sessions.append(session)
        }
    }

}

struct StudySession: Identifiable {

    let id = UUID()
    let subject: String
    var hours: Double
}
