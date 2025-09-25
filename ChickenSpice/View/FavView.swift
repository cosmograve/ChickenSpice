//
//  FavView.swift
//  ChickenSpice
//
//  Created by Алексей Авер on 24.09.2025.
//

import SwiftUI

struct FavView: View {
    var body: some View {
        VStack {
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Favourites")
                    .font(.custom(.MontserratSemiBold, size: 14))
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MainView()
}
