package com.xiaobo.device_id_plugin

import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.UUID

class DeviceIdPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "device_id_plugin")
      channel.setMethodCallHandler(DeviceIdPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getDeviceId") {
      result.success(getUniqueDeviceID())
    } else {
      result.notImplemented()
    }
  }

  private fun getUniqueDeviceID(): String {
    val devIDShort = "35" + Build.BOARD.length % 10 + Build.BRAND.length % 10 + Build.CPU_ABI.length % 10 + Build.DEVICE.length % 10 + Build.MANUFACTURER.length % 10 + Build.MODEL.length % 10 + Build.PRODUCT.length % 10

    var serial: String
    try {
      serial = android.os.Build::class.java!!.getField("SERIAL").get(null).toString()

      return UUID(devIDShort.hashCode().toLong(), serial.hashCode().toLong()).toString()
    } catch (exception: Exception) {
      serial = "serial"
    }

    return UUID(devIDShort.hashCode().toLong(), serial.hashCode().toLong()).toString()
  }
}
