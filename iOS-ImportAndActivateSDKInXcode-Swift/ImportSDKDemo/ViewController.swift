//
//  ViewController.swift
//  ImportSDKDemo
//
//  Created by DJI on 8/1/17.
//  Copyright © 2017 DJI. All rights reserved.
//

import UIKit
import DJISDK

class ViewController: UIViewController, DJISDKManagerDelegate {

    // viewの呼び出し 1度のみ (UIViewController)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // viewの表示完了後 (UIViewController)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DJISDKManager.registerApp(with: self)
    }

    // 低メモリ時 (UIViewController)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // info.plistのDJISDKAppKey検証後 (DJISDKManagerDelegate)
    func appRegisteredWithError(_ error: Error?) {
        
        var message = "Register App Successed!"
        if (error != nil) {
            message = "Register app failed! Please enter your app key and check the network."
        }else{
            NSLog("Register App Successed!");
        }
        
        self.showAlertViewWithTitle(title:"Register App", withMessage: message)
    }
    
    // dji製品と接続時 (DJISDKManagerDelegate)
    func productConnected(_ product: DJIBaseProduct?) {
        
        NSLog("Product Connected")
        self.showAlertViewWithTitle(title:"Register App", withMessage: "Product Connected")
    }
    
    // dji製品と接続解除時 (DJISDKManagerDelegate)
    func productDisconnected() {
        
        NSLog("Product Disconnected")
        self.showAlertViewWithTitle(title:"Register App", withMessage: "Disconnected")
    }

    
    
    // アラート表示
    func showAlertViewWithTitle(title: String, withMessage message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction.init(title:"OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // モータースタート
    func turnOnMotors(){
        if let aircraft = DJISDKManager.product() as? DJIAircraft {
            aircraft.flightController?.turnOnMotors(completion: nil)
        }
    }
    
    // モーターストップ
    func turnOffMotors(){
        if let aircraft = DJISDKManager.product() as? DJIAircraft {
            aircraft.flightController?.turnOffMotors(completion: nil)
        }
    }
    
    // 離陸
    func takeOff(){
        if let aircraft = DJISDKManager.product() as? DJIAircraft {
            aircraft.flightController?.startTakeoff(completion: nil)
        }
    }
    
    // 着陸
    func landing(){
        if let aircraft = DJISDKManager.product() as? DJIAircraft {
            aircraft.flightController?.startLanding(completion: nil)
        }
    }
    
    
}

