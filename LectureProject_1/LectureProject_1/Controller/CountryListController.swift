//
//  CountryListController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit
import ProgressHUD

class CountryListController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var model = [CountryModel(name: "Azerbaijan", flag: "aze",
                              cities: [CityModel(name: "Baku", image: "baku", text: "alkjdlaskld"),
                                       CityModel(name: "Ganja", image: "ganja", text: "alkjdlaskld"),
                                       CityModel(name: "Shusha", image: "susa", text: "alkjdlaskld")]),
                 CountryModel(name: "Turkey", flag: "tur",
                                           cities: [CityModel(name: "Istanbul", image: "istanbul", text: "alkjdlaskld"),
                                                    CityModel(name: "Izmir", image: "izmir", text: "alkjdlaskld"),
                                                    CityModel(name: "Mugla", image: "mugla", text: "alkjdlaskld")]),
                 CountryModel(name: "USA", flag: "usa",
                                           cities: [CityModel(name: "Los Angeles", image: "la", text: "alkjdlaskld"),
                                                    CityModel(name: "New York", image: "ny", text: "alkjdlaskld"),
                                                    CityModel(name: "Boston", image: "bos", text: "alkjdlaskld")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.isHidden = true
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.colorProgress = .systemBlue
        ProgressHUD.colorStatus = .brown
        ProgressHUD.show("Some text...")
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.table.isHidden = false
            ProgressHUD.dismiss()
        }
    }
}

extension CountryListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountryCell.self)") as! CountryCell
//        let data = model[indexPath.row]
//        cell.titleLabel.text = data.name
        cell.titleLabel.text = model[indexPath.row].name
//        cell.imageView?.image = UIImage(named: model[indexPath.row].flag)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = model[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityListController") as! CityListController
        controller.titleText = data.name
        controller.cityModel = data.cities
        show(controller, sender: nil)
    }
}
