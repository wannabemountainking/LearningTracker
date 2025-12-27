//
//  DataView.swift
//  LearningTracker
//
//  Created by yoonie on 12/27/25.
//

import SwiftUI
import Charts

struct DataView: View {
    
    @Environment(StudyTracker.self) var tracker
    
    var body: some View {
        VStack {
            Chart(tracker.sessions) { session in
                SectorMark(angle: .value("Hours", session.hours), angularInset: 3)
                    .cornerRadius(3)
                    .foregroundStyle(by: .value("Subject Label", session.subject))
                    .annotation(position: .overlay) {
                        Text("\(session.subject)\n\((session.hours / tracker.totalHours * 100).formatted(.number.precision(.fractionLength(1))))%")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
            }
            .padding()
        }
        .chartLegend(position: .bottom, alignment: .center, spacing: 10)
        .dynamicTypeSize(.accessibility2)
    }
}

#Preview {
    DataView()
        .environment(StudyTracker())
}
