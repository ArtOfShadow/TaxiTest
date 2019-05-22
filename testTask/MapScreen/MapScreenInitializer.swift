//
//  MapScreenInitializer.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import UIKit

class MapScreenInitializer {
    
    class func initialize (with city: City) -> UIViewController? {
        
        let viewInput : MapScreenViewInput = MapScreenViewController()
        viewInput.viewOutput = MapScreenPresenter(viewInput: viewInput,
                                                  city: city)
        
        return viewInput.viewController()
    }
}
