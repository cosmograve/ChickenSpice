//
//  MealView.swift
//  ChickenSpice
//
//  Created by Алексей Авер on 24.09.2025.
//

import SwiftUI

struct MealView: View {
    var body: some View {
        VStack {
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Week meal")
                    .font(.custom(.MontserratSemiBold, size: 14))
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MainView()
}
