//
//  MapScreenInterface.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import Foundation


/**
 TestScreen. Screen for the template purpose
 */

protocol MapScreenModuleInput: BaseModuleInput {
    
}

protocol MapScreenModuleOutput: BaseModuleOutput {
    //navigation is here, everything is connected to the flow controller
}

protocol MapScreenViewInput: BaseViewInput {
    //functions and fields to use in the ViewController class
    var viewOutput: MapScreenViewOutput? { get set }
}

protocol MapScreenViewOutput: BaseViewOutput {
    //functions and fields to use usually in the Presenter class
    var city: City { get set }
    func back()
}

protocol MapScreenPresenterProtocol: MapScreenModuleInput, MapScreenViewOutput {
    //presenter specific
}
