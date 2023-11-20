//
//  SearchView.swift
//  cleanmate
//
//  Created by 배성욱mac on 2023/11/20.
//

import SwiftUI

struct SearchView: View {
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
                        }
                    }
                }
                .navigationTitle("검색 ")
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
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onSearchButtonClicked: () -> Void

    var body: some View {
        HStack {
            TextField("검색어를 입력하세요", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Button(action: {
                self.onSearchButtonClicked()
            }) {
                Text("검색")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct CleaningInfoDetailView: View {
    let info: CleaningInfo

    var body: some View {
        VStack {
            Text(info.title)
                .font(.largeTitle)
            Text(info.description)
                .font(.body)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle(info.title)
    }
}
