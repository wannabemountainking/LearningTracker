//
//  AddSessionSheet.swift
//  LearningTracker
//
//  Created by yoonie on 12/27/25.
//

import SwiftUI

struct AddSessionSheet: View {
    @Environment(StudyTracker.self) var tracker
    @Environment(\.dismiss) var dismiss
    
    @State private var subjectName: String = ""
    @State private var studyingHourString: String = ""
    private var studyingHours: Double {
        return Double(studyingHourString) ?? 0.0
    }
    
    var body: some View {
        
        VStack(spacing: 50) {
            Text("새 학습 기록 추가")
                .font(.title)
            
            Form {
                VStack(alignment: .leading) {
                    Text("과목")
                    TextField("과목을 입력하세요", text: $subjectName)
                        .textFieldStyle(.roundedBorder)
                }
                .font(.title2)
                .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    Text("학습 시간")
                    TextField("학습 시간을 입력하세요", text: $studyingHourString)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }
                .font(.title2)
                .fontWeight(.semibold)
            }
            
            HStack(spacing: 100) {
                Button("취소") {
                    dismiss()
                }
                .buttonModifier()
                
                Button("저장") {
                    let studySession = StudySession(subject: subjectName, hours: studyingHours)
                    tracker.addSession(session: studySession)
                    dismiss()
                }
                .buttonModifier()
                .disabled(subjectName.isEmpty || studyingHours <= 0)
            }
        }
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 100, height: 30)
            .padding(5)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View {
    func buttonModifier() -> some View {
        modifier(ButtonModifier())
    }
}

#Preview {
    AddSessionSheet()
        .environment(StudyTracker())
}
