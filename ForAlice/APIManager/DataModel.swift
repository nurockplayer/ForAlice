//
//  DataModel.swift
//  Alice
//
//  Created by Tachikoma on 2018/7/29.
//  Copyright © 2018 tachikoma. All rights reserved.
//

import Foundation


struct StationModel : Decodable {
    let bikeAllowOnHoliday : Bool?
    let srcUpdateTime : String?
    let stationAddress : String?
    let stationID : String?
    let stationName : StationName?
    let stationPosition : StationPosition?
    let updateTime : String?
    
    enum CodingKeys: String, CodingKey {
        
        case bikeAllowOnHoliday = "BikeAllowOnHoliday"
        case srcUpdateTime = "SrcUpdateTime"
        case stationAddress = "StationAddress"
        case stationID = "StationID"
        case stationName = "StationName"
        case stationPosition = "StationPosition"
        case updateTime = "UpdateTime"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bikeAllowOnHoliday = try values.decodeIfPresent(Bool.self, forKey: .bikeAllowOnHoliday)
        srcUpdateTime = try values.decodeIfPresent(String.self, forKey: .srcUpdateTime)
        stationAddress = try values.decodeIfPresent(String.self, forKey: .stationAddress)
        stationID = try values.decodeIfPresent(String.self, forKey: .stationID)
        stationName = try values.decodeIfPresent(StationName.self, forKey: .stationName)
        stationPosition = try values.decodeIfPresent(StationPosition.self, forKey: .stationPosition)
        updateTime = try values.decodeIfPresent(String.self, forKey: .updateTime)
    }
}


struct StationName : Decodable {
    let en : String?
    let zh_tw : String?
    
    enum CodingKeys: String, CodingKey {
        
        case en = "En"
        case zh_tw = "Zh_tw"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        en = try values.decodeIfPresent(String.self, forKey: .en)
        zh_tw = try values.decodeIfPresent(String.self, forKey: .zh_tw)
    }
}


struct StationPosition : Decodable {
    let positionLat : Double?
    let positionLon : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case positionLat = "PositionLat"
        case positionLon = "PositionLon"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        positionLat = try values.decodeIfPresent(Double.self, forKey: .positionLat)
        positionLon = try values.decodeIfPresent(Double.self, forKey: .positionLon)
    }
    
}

