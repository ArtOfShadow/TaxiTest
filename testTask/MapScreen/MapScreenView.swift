//
//  MapScreenView.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import UIKit
import MapKit

class MapScreenView: BaseScreenView {
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var viewMap: MKMapView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func onBack(_ sender: Any) {
    
    }
    
}
