//
//  CityScreenViewController.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import UIKit

class CityScreenViewController: BaseViewController, BaseViewProtocol, BaseViewControllerOutputProtocol {
    typealias ViewClass = CityScreenView//view to use with this controller, have to be configured properly in xib
    typealias OutputClass = CityScreenViewOutput//output to use with this controller

    var viewOutput: CityScreenViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.tableCities.delegate = self
        rootView.tableCities.dataSource = self
        //rootView.tableCities.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        
        rootView.tableCities.register(CityCollectionViewCell.self)
        
        viewOutput?.didLoad()
    }


}

extension CityScreenViewController: CityScreenViewInput{

    
    func updateTable() {
        rootView.tableCities.reloadData()
    }
    
    
}


extension CityScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewOutput?.cellDescriptions.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cells = viewOutput?.cellDescriptions else { return UICollectionViewCell() }
        return collectionView.configureCell(with: cells[indexPath.row], for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let city = viewOutput?.cities?[indexPath.row] else {return}
        if let vc = MapScreenInitializer.initialize(with: city)
        {
            present(vc, animated: true, completion: nil)
        }
    }
    
}

extension CityScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (rootView.inputView?.bounds.width ?? UIScreen.main.bounds.width) - 30, height: 60.0)
    }
}
