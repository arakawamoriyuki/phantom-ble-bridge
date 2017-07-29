
## Build

下記は独自に編集が必要なのでcommit対象に含めない
```
git update-index --skip-worktree SwiftSampleCode/DJISDKSwiftDemo/Info.plist
git update-index --skip-worktree SwiftSampleCode/DJISDKSwiftDemo.xcodeproj/project.pbxproj
```

### pod install

- $ sudo gem install cocoapods
- $ pod repo update
- $ pod install

### dji developer registration

- dji developer https://developer.dji.com/
- create app

### xcode setting

- Xcodeproject -> General -> Signing
- Xcodeproject -> General -> Identifier -> Bundle Identifier
- Info.plist -> DJISDKAppKey

### shantom setting

- fw update
- asp mode f(p3) p(p4)


## Snippets

### Start connection

```
DJISDKManager.startConnectionToProduct()
```

### Stop connection

```
DJISDKManager.stopConnectionToProduct()
```

### Turn on motors

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.turnOnMotorsWithCompletion()
}
```

### Turn off motors

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.turnOffMotorsWithCompletion()
}
```

### Take Off

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.startTakeoffWithCompletion()
}
```

### Landing

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.startLandingWithCompletion()
}
```

### Go home

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.startGoHomeWithCompletion()
}
```

### Go home cancel

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.cancelGoHomeWithCompletion()
}
```

### Controll

```
if let aircraft = DJISDKManager.product() as? DJIAircraft {
  aircraft.flightController.setVirtualStickModeEnabled(true)
  if aircraft.flightController.isVirtualStickControlModeAvailable() {

    # 秒単位での操作?
    # Filter the angle between -180 ~ 0, 0 ~ 180
    DJIVirtualStickFlightControlData data;
    data.pitch = 0
    data.roll = 0
    data.yaw = 180
    data.verticalThrottle = 0

    aircraft.sendVirtualStickFlightControlData(data)
  }
}
```

### Controll log

TODO:
https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/SimulatorDemo.html

### Video feeder

TODO:


## Tips

- [Bridge App](https://github.com/dji-sdk/iOS-Bridge-App
https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/BridgeAppDemo.html) iOS二台必要

- [Remote Logging](https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/RemoteLoggerDemo.html)

- [Simulator](
https://developer.dji.com/mobile-sdk/documentation/application-development-workflow/workflow-testing.html) winでp3は可能、macはp4やSpark,Mavicに対応。
















#
