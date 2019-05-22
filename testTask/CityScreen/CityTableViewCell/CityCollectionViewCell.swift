//
//  CityCollectionViewCell.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import UIKit


struct CityCollectionCellObject {
    let name: String
    let id: Int
    
    init(name: String, id: Int) {
        self.id = id
        self.name = name
    }
}


class CityCollectionViewCell: UICollectionViewCell, BaseCollectionViewCell {
    @IBOutlet weak var lblCityId: UILabel!
    @IBOutlet weak var lblCityName: UILabel!
    
    
    
    func configure(for object: Any?) {
        guard let object = object as? CityCollectionCellObject else { return }
        
        lblCityId.text = "\(object.id)"
        lblCityName.text = object.name
        
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.3882352941, blue: 0.9215686275, alpha: 1)
    }
    



}
