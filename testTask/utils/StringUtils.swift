//
//  StringUtils.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

import Foundation


extension String {
    
    var localized: String {
        get {
            return NSLocalizedString(self, comment: "")
        }
}
}
