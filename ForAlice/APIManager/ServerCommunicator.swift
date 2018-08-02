//
//  ServerCommunicator.swift
//  Alice
//
//  Created by Tachikoma on 2018/7/29.
//  Copyright © 2018 tachikoma. All rights reserved.
//

import Foundation
import Alamofire


class ServerCommunicator{
    static let shared = ServerCommunicator()
 
    func getStationData(clouserResponse: @escaping (DataResponse<Any>) -> Void)
    {
        
        let url = "https://stations-98a59.firebaseio.com/.json"
        
        self.doGet(url) { (response) in
            
            clouserResponse(response)
        }
    }
    
    private func doGet(_ url:String, completion: @escaping (DataResponse<Any>) -> Void) {
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            DispatchQueue.global().async {
                
                if response.result.isFailure{
                    
                    if let error = response.result.error {
                        print("-> \(error) <-")
                    }
                }
                
                completion(response)
            }
        }
    }
    
    private func doPost(_ url:String, parameters:Parameters,
                        completion: @escaping (DataResponse<Any>) -> Void)
    {
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            
            DispatchQueue.global().async {
                
                if response.result.isFailure{
                    if let error = response.result.error {
                        print("-> \(error) <-")
                    }
                }
                completion(response)
            }
            
        }
    }
    
}
