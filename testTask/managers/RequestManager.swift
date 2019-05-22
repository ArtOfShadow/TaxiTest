//
//  RequestManager.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import Foundation

protocol RequestProtocolDelegate {
    func finished (with cities: [City]?, _ error: Error?)
}



class CityRequest: NSObject {
    
    static var delegate: RequestProtocolDelegate?
    
    
    class func request (/*_ complete : @escaping (_ cities: [City]?, _ error: Error?) -> Void*/) {
        let requestSession = URLSession.shared
        
        guard let url = URL(string: "https://beta.taxistock.ru/taxik/api/test/") else { return  }

        
            let dataTask = requestSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        delegate?.finished(with: nil, error)
                        //complete(nil, error)
                    }
                    return
                }
                else {
                    if data != nil {
                        let responseJSON = try? JSONDecoder().decode(ResponseJSON.self, from: data!)
                        DispatchQueue.main.async {
                        delegate?.finished(with: responseJSON?.cities, nil)
                        //complete(responseJSON?.cities, nil)
                        }
                    }
                }
            }
            dataTask.resume()
        }
}

extension CityRequest: URLSessionDelegate {
    
}
