//
//  CityScreenPresenter.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import Foundation

class CityScreenPresenter: CityScreenPresenterProtocol {
    
    var cellDescriptions: [CollectionViewCellDescription] = []
    var cities: [City]?
    
    unowned let viewInput: CityScreenViewInput
    unowned var moduleOutput: CityScreenModuleOutput?
    
    let requestManager = CityRequest()
    
    init(viewInput: CityScreenViewInput, moduleOutput: CityScreenModuleOutput?) {
        self.viewInput = viewInput
        self.moduleOutput = moduleOutput
        
        CityRequest.delegate = self
    }

    
    func didLoad() {
        self.viewInput.showLoading()
        CityRequest.request()
    }
    
    func updateCities() {
        CityRequest.request()
    }
}


extension CityScreenPresenter: RequestProtocolDelegate {
    func finished(with cities: [City]?, _ error: Error?) {
        self.viewInput.hideLoading()
        
        self.cellDescriptions.removeAll()
        
        guard error == nil  else {
            self.viewInput.show(error: error!)
            return
        }
        
        self.cities = cities!.sorted{ $0.order < $1.order }
        
        self.cities?.forEach{ city in
            self.cellDescriptions.append(CollectionViewCellDescription(
                cellType: CityCollectionViewCell.self,
                object: CityCollectionCellObject(name: city.cityName, id: city.cityID)))
        }
        
        DispatchQueue.main.async {
            self.viewInput.updateTable()
        }
    }
    
    
}
