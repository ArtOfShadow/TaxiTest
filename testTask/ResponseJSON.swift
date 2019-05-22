//
//  ResponseJSON.swift
//  testTask
//
//  Created by Andrey Gavryutenkov on 5/21/19.
//  Copyright © 2019 Andrey Gavryutenkov. All rights reserved.
//

//let = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ResponseJSON: Codable {
    let cities: [City]?
}

// City.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - City
struct City: Codable {
    let cityID: Int
    let cityName: String
    let order: Int
    let cityLatitude: Double
    let cityLongitude: Double
    let citySpnLatitude: Double
    let citySpnLongitude: Double
    let lastAppAndroidVersion: Int
    let transfers: Bool
    let clientEmailRequired: Bool
    let registrationPromocode: Bool
    let parentCity: Int
    
    enum CodingKeys: String, CodingKey {
        case cityID = "city_id"
        case cityName = "city_name"
        case order
        case cityLatitude = "city_latitude"
        case cityLongitude = "city_longitude"
        case citySpnLatitude = "city_spn_latitude"
        case citySpnLongitude = "city_spn_longitude"
        case lastAppAndroidVersion = "last_app_android_version"
        case transfers
        case clientEmailRequired = "client_email_required"
        case registrationPromocode = "registration_promocode"
        case parentCity = "parent_city"
    }
    
    init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        cityID = try values.decode(Int.self, forKey: .cityID)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName) ?? "NotPresent"
        order = try values.decodeIfPresent(Int.self, forKey: .order) ?? 0
        cityLatitude = try values.decodeIfPresent(Double.self, forKey: .cityLatitude) ?? 0.0
        cityLongitude = try values.decodeIfPresent(Double.self, forKey: .cityLongitude) ?? 0.0
        citySpnLatitude = try values.decodeIfPresent(Double.self, forKey: .citySpnLatitude) ?? 0.0
        citySpnLongitude = try values.decodeIfPresent(Double.self, forKey: .citySpnLongitude) ?? 0.0
        lastAppAndroidVersion = try values.decodeIfPresent(Int.self, forKey: .lastAppAndroidVersion) ?? 0
        transfers = try values.decodeIfPresent(Bool.self, forKey: .transfers) ?? false
        clientEmailRequired = try values.decodeIfPresent(Bool.self, forKey: .clientEmailRequired) ?? false
        registrationPromocode = try values.decodeIfPresent(Bool.self, forKey: .registrationPromocode) ?? false
        parentCity  = try values.decodeIfPresent(Int.self, forKey: .parentCity) ?? -1
        
    }
}

