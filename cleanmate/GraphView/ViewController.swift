//
//  ViewController.swift
//  cleanmate
//
//  Created by 배성욱mac on 2023/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cleaningCategories = ["거실", "부엌", "화장실", "침실"]
    var completedCategories: Set<String> = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // TableView 설정
        tableView.delegate = self
        tableView.dataSource = self
    }

    // TableView DataSource 메서드 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cleaningCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cleaningCell", for: indexPath)
        let category = cleaningCategories[indexPath.row]

        cell.textLabel?.text = category

        // 체크박스 설정
        if completedCategories.contains(category) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    // TableView Delegate 메서드 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedCategory = cleaningCategories[indexPath.row]

        // 완료 여부 토글
        if completedCategories.contains(selectedCategory) {
            completedCategories.remove(selectedCategory)
        } else {
            completedCategories.insert(selectedCategory)
        }

        // TableView 갱신
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    // 청소 완료 버튼 액션
    @IBAction func completeCleaning(_ sender: UIButton) {
        // 완료된 청소 카테고리 출력 또는 다른 작업 수행
        print("완료된 청소 카테고리: \(completedCategories)")
    }
}

