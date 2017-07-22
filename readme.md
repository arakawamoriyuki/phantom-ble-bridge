
TODO: Bridge App
https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/BridgeAppDemo.html
TODO: Remote Logging
https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/RemoteLoggerDemo.html
TODO: Simulator
http://www.dji.com/jp/phantom-3/info#downloads
https://developer.dji.com/mobile-sdk/documentation/application-development-workflow/workflow-testing.html



## Build

- fw update
- asp mode f(p3) p(p4)
- xcodeproject -> general -> signing
- Info.plist -> DJISDKAppKey


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

### Bridge App

https://github.com/dji-sdk/iOS-Bridge-App
https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/BridgeAppDemo.html

### Remote Logging

https://developer.dji.com/mobile-sdk/documentation/ios-tutorials/RemoteLoggerDemo.html

### Simulator

http://www.dji.com/jp/phantom-3/info#downloads
https://developer.dji.com/mobile-sdk/documentation/application-development-workflow/workflow-testing.html
















#