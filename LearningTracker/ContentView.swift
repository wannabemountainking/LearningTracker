//
//  ContentView.swift
//  LearningTracker
//
//  Created by YoonieMac on 12/27/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(StudyTracker.self) var tracker
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("학습시간 트래커")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            if tracker.sessions.isEmpty {
                NoDataSubView()
            } else {
                DataView()
            }
            
            Button {
                //action
                showSheet.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.blue)
            }
            .symbolEffect(.bounce, value: showSheet)
            .sheet(isPresented: $showSheet) {
                AddSessionSheet()
                    .presentationDetents([.medium])
            }
            
            Spacer()

        }
    }
}

#Preview {
    ContentView()
        .environment(StudyTracker())
}
 
