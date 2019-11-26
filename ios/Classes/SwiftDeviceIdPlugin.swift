import Flutter
import UIKit

public class SwiftDeviceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_id_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.name="getDeviceId" {
        result(UIDevice.current.identifierForVendor?.uuidString ?? "")
    }
    
  }
}
