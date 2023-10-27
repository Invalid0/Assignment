//
//  Micros.swift
//  Assignment
//
//  Created by EMPULSE on 27/10/23.
//

import Foundation
import UIKit

struct Endpoints{
    let url = "https://api.github.com/repos/Alamofire/Alamofire/issues"
}


let tableViewCell = UINib(nibName: "TableViewCell", bundle: nil)

extension UIView{
    func roundRadius(radiusValue: CGFloat = 2, borderWidth: CGFloat = 1,borderColor: UIColor = .black) {
           self.layer.cornerRadius = radiusValue
           self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
       }
}
