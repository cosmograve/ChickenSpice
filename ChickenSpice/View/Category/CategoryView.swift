//
//  CategoryView.swift
//  ChickenSpice
//
//  Created by Алексей Авер on 24.09.2025.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var viewModel = DailyRecipeViewModel()
    private let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    var body: some View {
        VStack {
            if let recipe = viewModel.todaysRecipe {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.tabSelect)
                    HStack {
                        VStack(alignment: .leading) {
                            ZStack {
                                Capsule()
                                    .frame(width: 107, height: 35)
                                    
                                Text("Today's choice")
                                    .foregroundStyle(.white)
                                    .font(.custom(.MontserratSemiBold, size: 12))
                                    
                            }
                            .padding(.top, 10)
                            Text(recipe.title)
                                .font(.custom(.MontserratBold, size: 14))
                                .foregroundStyle(.white)
                            Text(recipe.description)
                                .font(.custom(.MontserratRegular, size: 12))
                                .foregroundStyle(.white.opacity(0.6))
                                .minimumScaleFactor(0.5)
                        }
                        .padding(.bottom, 12)
                        
                        Spacer()
                        
                        ZStack {
                            Image(recipe.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 160)
                                .clipShape(Circle())
                        }
                        .frame(width: 100, height: 136)
                        .offset(x: 20)
                    }
                    .padding(.leading, 20)
                    
                }
                .frame(width: .infinity, height: 136)
                .clipped()
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Categories.allCases, id: \.self) { category in
                        NavigationLink {
                            RecipesListView(category: category)
                        } label: {
                            CategoryCard(category: category)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(16)
            }
            .navigationTitle("Categories")
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Category")
                    .font(.custom(.MontserratSemiBold, size: 14))
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MainView()
}

struct CategoryCard: View {
    let category: Categories
        
        var body: some View {
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .foregroundColor(.clear)
                    .overlay(
                        Image(category.icon)
                            .resizable()
                            .scaledToFill()
                    )
                    .clipped()
                
                Text(category.title)
                    .font(.custom(.MontserratBold, size: 18))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
            }
            .frame(height: UIScreen.main.bounds.height / 4)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
        }
}

struct RecipesListView: View {
    let category: Categories
    
    var body: some View {
        Text("Recipes for \(category.title)")
            .navigationTitle(category.title)
    }
}
