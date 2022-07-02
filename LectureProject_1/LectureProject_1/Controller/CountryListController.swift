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
    
    var model = [CountryModel]()
//    [CountryModel(name: "Azerbaijan", flag: "aze",
//                              cities: [CityModel(name: "Baku", image: "baku", text: "alkjdlaskld"),
//                                       CityModel(name: "Ganja", image: "ganja", text: "alkjdlaskld"),
//                                       CityModel(name: "Shusha", image: "susa", text: "alkjdlaskld")]),
//                 CountryModel(name: "Turkey", flag: "tur",
//                                           cities: [CityModel(name: "Istanbul", image: "istanbul", text: "alkjdlaskld"),
//                                                    CityModel(name: "Izmir", image: "izmir", text: "alkjdlaskld"),
//                                                    CityModel(name: "Mugla", image: "mugla", text: "alkjdlaskld")]),
//                 CountryModel(name: "USA", flag: "usa",
//                                           cities: [CityModel(name: "Los Angeles", image: "la", text: "alkjdlaskld"),
//                                                    CityModel(name: "New York", image: "ny", text: "alkjdlaskld"),
//                                                    CityModel(name: "Boston", image: "bos", text: "alkjdlaskld")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.register(UINib(nibName: "\(NewCountryCell.self)", bundle: nil), forCellReuseIdentifier: "\(NewCountryCell.self)")
//        progressSetup()
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            self.jsonSetup()
        }
    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "Country", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                model = try JSONDecoder().decode([CountryModel].self, from: data)
                table.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            
        }
        
        print("")
    }
    
    func progressSetup() {
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
    
    func navigate(index: Int) {
        let data = model[index]
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityListController") as! CityListController
        controller.titleText = data.name
        controller.cityModel = data.cities
        show(controller, sender: nil)
    }
}

extension CountryListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewCountryCell.self)") as! NewCountryCell
        cell.tag = indexPath.row
        cell.delegate = self
        cell.titleLabel.text = model[indexPath.row].name
//        cell.imageView?.image = UIImage(named: model[indexPath.row].flag)
        
        cell.buttonCallback = { index in
            self.navigate(index: index)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigate(index: indexPath.row)
    }
}

extension CountryListController: NewCountryCellDelegate {
    func actionButtonCalled(index: Int) {
        navigate(index: index)
    }
}
