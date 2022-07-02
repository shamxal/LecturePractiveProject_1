//
//  NewCountryCell.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 30.06.22.
//

import UIKit
 
protocol NewCountryCellDelegate {
    func actionButtonCalled(index: Int)
}

class NewCountryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var delegate: NewCountryCellDelegate?
    
    var buttonCallback: ((Int)->())?
    
    @IBAction func actionButtonTapped(_ sender: Any) {
//        delegate?.actionButtonCalled(index: tag)
        buttonCallback?(tag)
    }
}
