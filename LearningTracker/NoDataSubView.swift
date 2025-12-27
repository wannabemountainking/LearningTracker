//
//  NoDataSubView.swift
//  LearningTracker
//
//  Created by yoonie on 12/27/25.
//

import SwiftUI

struct NoDataSubView: View {
    var body: some View {
        ContentUnavailableView(
            "학습 기록 없음",
            systemImage: "books.vertical",
            description: Text("시작하려면 추가 버튼을 눌러주세요")
        )
        .foregroundStyle(.cyan, .blue)
    }
}

#Preview {
    NoDataSubView()
}
