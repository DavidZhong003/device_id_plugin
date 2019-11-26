import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_id_plugin/device_id_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_id_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DeviceIdPlugin.platformVersion, '42');
  });
}
