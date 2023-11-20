//
//  CleaningInfo.swift
//  cleanmate
//
//  Created by 배성욱mac on 2023/11/20.
//

//import Foundation
//
//struct CleaningInfo: Identifiable {
//    let id = UUID()
//    let title: String
//    let description: String
//}
//
//let cleaningInfoData = [
//    CleaningInfo(title: "거실 청소", description: "거실을 청소하는 방법과 팁"),
//    CleaningInfo(title: "부엌 청소", description: "부엌을 청소하는 방법과 팁"),
//    CleaningInfo(title: "room", description: "화장실을 청소하는 방법과 팁"),
//    CleaningInfo(title: "침실 청소", description: "침실을 청소하는 방법과 팁"),
//    // 기타 청소 정보들...
//]
//

import SwiftUI

struct CleaningInfo: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let youtubeLink: String? // 유튜브 링크 추가
}

let cleaningInfoData = [
    CleaningInfo(title: "bathroom", description: "욕실 청소하는 방법과 팁", youtubeLink: "https://www.youtube.com/watch?v=ig6NU9oyb54"),
    CleaningInfo(title: "kitchen", description: "부엌을 청소하는 방법과 팁", youtubeLink: "https://www.youtube.com/watch?v=your_youtube_video_id"),
    // 나머지 청소 정보들...
]

struct Search: View {
    @State private var searchText = ""
    @State private var searchResults: [CleaningInfo] = []

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearchButtonClicked: search)
                    .padding()

                List(searchResults) { result in
                    NavigationLink(destination: CleaningInfoDetailView(info: result)) {
                        VStack(alignment: .leading) {
                            Text(result.title)
                                .font(.headline)
                            Text(result.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            // 유튜브 버튼 추가
                            if let youtubeLink = result.youtubeLink {
                                Button(action: {
                                    openYoutubeLink(youtubeLink)
                                }) {
                                    Text("유튜브로 보기")
                                        .foregroundColor(.blue)
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("검색 결과")
            }
        }
    }

    private func search() {
        if searchText.isEmpty {
            searchResults = []
        } else {
            searchResults = cleaningInfoData.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

    // 유튜브 링크를 여는 함수
    private func openYoutubeLink(_ link: String) {
        if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// 나머지 부분은 이전과 동일합니다.

