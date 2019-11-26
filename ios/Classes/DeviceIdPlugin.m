#import "DeviceIdPlugin.h"
#import <device_id_plugin/device_id_plugin-Swift.h>

@implementation DeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceIdPlugin registerWithRegistrar:registrar];
}
@end
