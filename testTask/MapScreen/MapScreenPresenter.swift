//
//  MapScreenPresenter.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import Foundation

class MapScreenPresenter: MapScreenPresenterProtocol {
    var city: City
    
    unowned let viewInput: MapScreenViewInput

    
    init(viewInput: MapScreenViewInput, city: City) {
        self.viewInput = viewInput
        self.city = city
    }
   
    
    
    

}

extension MapScreenPresenter: MapScreenViewOutput {

    
    func back() {
        viewInput.dismiss()
    }
    
    
}
