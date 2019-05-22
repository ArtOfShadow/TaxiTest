//
//  CityScreenInterface.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import Foundation


/**
 TestScreen. Screen for the template purpose
 */

protocol CityScreenModuleInput: BaseModuleInput {
}

protocol CityScreenModuleOutput: BaseModuleOutput {
    //navigation is here, everything is connected to the flow controller
}

protocol CityScreenViewInput: BaseViewInput {
    //functions and fields to use in the ViewController class
    var viewOutput: CityScreenViewOutput? { get set }
    
    func updateTable()
}

protocol CityScreenViewOutput: BaseViewOutput {
    //functions and fields to use usually in the Presenter class
    
    var cities: [City]? { get }
    var cellDescriptions: [CollectionViewCellDescription] { get set }
    func didLoad()
    func updateCities ()
    
}

protocol CityScreenPresenterProtocol: CityScreenModuleInput, CityScreenViewOutput {
    //presenter specific
}
