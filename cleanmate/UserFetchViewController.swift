import UIKit

class UserFetchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 서버 URL
        guard let url = URL(string: "http://localhost:3000/users") else {
            return
        }

        // HTTP 요청 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // URLSession을 사용하여 요청 보내기
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 에러 처리
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // 응답 처리
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonArray = jsonObject as? [[String: Any]] {
                        // 서버로부터 받은 사용자 데이터를 활용하여 작업 수행
                        print("Users: \(jsonArray)")
                    }
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                }
            }
        }

        // 요청 보내기
        task.resume()
    }
}
