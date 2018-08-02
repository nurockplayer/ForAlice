//
//  ViewController.swift
//  ForAlice
//
//  Created by Tachikoma on 2018/8/2.
//  Copyright © 2018 tachikoma. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginBtn = FBSDKLoginButton()
        loginBtn.center = view.center
        view.addSubview(loginBtn)
    }


    func getStationData() {
        let dataManager = DataManager.shared
        
        DispatchQueue.global().async {
            
            dataManager.getStationData { (station, message) in
                print("back to VC")
                DispatchQueue.main.async {
                    
                    guard let stationName = station?.stationName else {
                        print("error : \(message)")
                        return
                    }
                    
                    print(stationName.en!)
                    print(stationName.zh_tw!)
                }
            }
        }
    }

}

