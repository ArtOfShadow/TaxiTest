//
//  MapScreenViewController.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import UIKit
import MapKit


class MapScreenViewController: BaseViewController, BaseViewProtocol, BaseViewControllerOutputProtocol {
    typealias ViewClass = MapScreenView
    typealias OutputClass = MapScreenViewOutput
     var viewOutput: MapScreenViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let city = viewOutput?.city else { return }
            let lat = city.cityLatitude
            let lng = city.cityLongitude
        
        rootView.lblCityName.text = city.cityName
        let cityLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        centerMapOnLocation(location: cityLocation)
        addAnnotation(coordinate: cityLocation)
    }
    
    
    private func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let regionRadius: CLLocationDistance = 3000
        let coordinateRegion = MKCoordinateRegion(center: location,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        rootView.viewMap.setRegion(coordinateRegion, animated: true)
        
    }
    
    private func addAnnotation(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = "latitude \(coordinate.latitude), longitude \(coordinate.longitude)"
        annotation.coordinate = coordinate
        
        rootView.viewMap.addAnnotation(annotation)
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        viewOutput?.back()
    }
    

}


extension MapScreenViewController: MapScreenViewInput{
    
}
