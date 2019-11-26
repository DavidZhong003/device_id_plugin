import 'dart:async';

import 'package:flutter/services.dart';

class DeviceIdPlugin {
  static const MethodChannel _channel =
      const MethodChannel('device_id_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getDeviceId');
    return version;
  }
}
