//
//  cleanmateApp.swift
//  cleanmate
//
//  Created by 배성욱mac on 2023/11/13.
//

import SwiftUI

@main
struct cleanmateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            // 첫 번째 탭: 청소 목록
            CleaningView()
                .tabItem {
                    Label("청소 목록", systemImage: "list.bullet")
                }

            // 두 번째 탭: 검색
            SearchView()
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("CleanMate")
    }
}

