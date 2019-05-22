//
//  CityScreenInitializer.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import UIKit


class CityScreenInitializer {
    
    class func initialize () -> UIViewController? {
        
        let viewInput : CityScreenViewInput = CityScreenViewController()
        let presenter = CityScreenPresenter(viewInput: viewInput,
                                            moduleOutput: nil)

        viewInput.viewOutput = presenter

        return viewInput.viewController()
    }
}
