//
//  CityListController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit

class CityListController: UIViewController {

    var titleText = ""
    var cityModel = [CityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleText
    }
}

extension CityListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CityCell.self)", for: indexPath) as! CityCell
        cell.titleLabel.text = cityModel[indexPath.item].name
        cell.cityImage.image = UIImage(named: cityModel[indexPath.item].image)
//        UIView.animate(withDuration: TimeInterval(indexPath.item * 1)) {
//            cell.alpha = 1
//            self.view.layoutIfNeeded()
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityController") as! CityController
//        controller.key = cityImages[key]?[indexPath.item] ?? ""
//        controller.titleText = cityList[key]?[indexPath.item] ?? ""
        controller.city = cityModel[indexPath.item]
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
//        show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 2 - 10
        return CGSize(width: size, height: size)
    }
}
