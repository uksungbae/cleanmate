import SwiftUI

struct CleaningView: View {
    @State private var cleaningCategories = ["거실", "부엌", "화장실", "침실"]
    @State private var completedCategories: Set<String> = []
    @State private var isGraphVisible = true // 항상 표시되도록 변경

    var body: some View {
        NavigationView {
            VStack {
                // 원형 그래프 항상 표시
                PieChart(data: completedCategories.count)
                    .frame(width: 200, height: 200)
                    .padding()

                List {
                    ForEach(cleaningCategories, id: \.self) { category in
                        HStack {
                            Text(category)
                            Spacer()
                            if completedCategories.contains(category) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green) // 녹색으로 표시
                            }
                        }
                        .onTapGesture {
                            self.toggleCompletion(category)
                        }
                    }
                }
            }
            .navigationTitle("CleanMate")
        }
    }

    private func toggleCompletion(_ category: String) {
        if completedCategories.contains(category) {
            completedCategories.remove(category)
        } else {
            completedCategories.insert(category)
        }
    }
}

struct CleaningView_Previews: PreviewProvider {
    static var previews: some View {
        CleaningView()
    }
}

// PieChart 뷰
struct PieChart: View {
    var data: Int

    var body: some View {
        ZStack {
            // 녹색 부분 (완료된 카테고리에 따라 조절)
            Circle()
                .trim(from: 0, to: CGFloat(data) / 4) // 4로 나누어 1/4까지만 표시하도록 설정
                .stroke(Color.green, lineWidth: 30)

            // 회색 부분
            Circle()
                .trim(from: CGFloat(data) / 4, to: 1) // 나머지 3/4를 회색으로 표시
                .stroke(Color.gray, lineWidth: 30)
        }
        .rotationEffect(.degrees(-90)) // 12시 방향에서 시작되도록 회전
    }
}
