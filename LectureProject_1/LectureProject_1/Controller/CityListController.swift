//
//  CityListController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit

class CityListController: UIViewController {

    var key = ""
    var titleText = ""
    let cityList = ["aze": ["Baku", "Ganja", "Shusha"],
                    "tur": ["Istanbul", "Izmir", "Mugla"],
                    "usa": ["Los Angeles", "New York", "Boston"]]
    
    let cityImages = ["aze": ["baku", "ganja", "susa"],
                      "tur": ["istanbul", "izmir", "mugla"],
                      "usa": ["la", "ny", "bos"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleText
    }
}

extension CityListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList[key]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CityCell.self)", for: indexPath) as! CityCell
        cell.titleLabel.text = cityList[key]?[indexPath.item]
        cell.cityImage.image = UIImage(named: cityImages[key]?[indexPath.item] ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityController") as! CityController
        controller.key = cityImages[key]?[indexPath.item] ?? ""
        controller.titleText = cityList[key]?[indexPath.item] ?? ""
        show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 2 - 10
        return CGSize(width: size, height: size)
    }
}
