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
        self.showAlertViewWithTitle(title:"Product Connection", withMessage: "Product Connected")
    }
    
    // dji製品と接続解除時 (DJISDKManagerDelegate)
    func productDisconnected() {
        
        NSLog("Product Disconnected")
        self.showAlertViewWithTitle(title:"Product Connection", withMessage: "Disconnected")
    }

    
    
    // モータースタート
    @IBAction func onTurnOnMotorsButtonTouchUp(_ sender: Any) {
        
        NSLog("onTurnOnMotorButtonTouchUp")
        
        if let aircraft = DJISDKManager.product() as? DJIAircraft {
            aircraft.flightController?.turnOnMotors(completion: nil)
        }else{
            self.showAlertViewWithTitle(title:"Action", withMessage: "Product Connection Not Found")
        }
    }
    
    // モーターストップ
    @IBAction func onTurnOffMotorsButtonTouchUp(_ sender: Any) {
        
        NSLog("onTurnOffMotorButtonTouchUp")
        
        if let aircraft = DJISDKManager.product() as? DJIAircraft {
            aircraft.flightController?.turnOffMotors(completion: nil)
        }else{
            self.showAlertViewWithTitle(title:"Action", withMessage: "Product Connection Not Found")
        }
    }
    
    // 離陸
    @IBAction func onTakeOffButtonTouchUp(_ sender: Any) {
        
        NSLog("onTakeOffButtonTouchUp")
        
//        if let aircraft = DJISDKManager.product() as? DJIAircraft {
//            aircraft.flightController?.startTakeoff(completion: nil)
//        }else{
//            self.showAlertViewWithTitle(title:"Action", withMessage: "Product Connection Not Found")
//        }
    }
    
    // 着陸
    @IBAction func onLandingButtonTouchUp(_ sender: Any) {
        
        NSLog("onLandingButtonTouchUp")
        
//        if let aircraft = DJISDKManager.product() as? DJIAircraft {
//            aircraft.flightController?.startLanding(completion: nil)
//        }else{
//            self.showAlertViewWithTitle(title:"Action", withMessage: "Product Connection Not Found")
//        }
    }
    
    
    
    // アラート表示
    func showAlertViewWithTitle(title: String, withMessage message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction.init(title:"OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

