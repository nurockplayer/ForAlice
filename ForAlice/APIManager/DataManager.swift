//
//  DataManager.swift
//  Alice
//
//  Created by Tachikoma on 2018/7/29.
//  Copyright © 2018 tachikoma. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    
    static let shared = DataManager()
    
    private let comm = ServerCommunicator.shared
    private let jsonDecoder = JSONDecoder()
    
    func getStationData(completion: @escaping (_ station:StationModel?,_ message: String) -> Void) {
        comm.getStationData { (response) in
            
                if response.result.isFailure {
                    completion(nil,"請確認網路環境")
                    return
                }
                
                do {
                    if response.response?.statusCode == 200 {
                        
                        let station:StationModel = try self.jsonDecoder.decode(StationModel.self, from: response.data!)
                        
                        completion(station,"do jsonDecoder success")
                    } else {
                        completion(nil,String(describing: response.response?.statusCode))
                    }
                }
                catch let jsonError {
                    print(jsonError)
                    completion(nil,"do jsonDecoder error")
                }
            
            
        }
    }

}


