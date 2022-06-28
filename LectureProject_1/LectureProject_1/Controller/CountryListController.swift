//
//  CountryListController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit

class CountryListController: UIViewController {

    var keys = ["aze", "tur", "usa"]
    var countryArray = ["Azerbaijan", "Turkey", "USA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CountryListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountryCell.self)") as! CountryCell
        cell.titleLabel.text = countryArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityListController") as! CityListController
        controller.key = keys[indexPath.row]
        controller.titleText = countryArray[indexPath.row]
        show(controller, sender: nil)
    }
}
