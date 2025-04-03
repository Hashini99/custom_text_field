import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'custom_text_field_plugin_platform_interface.dart';

/// An implementation of [CustomTextFieldPluginPlatform] that uses method channels.
class MethodChannelCustomTextFieldPlugin extends CustomTextFieldPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('custom_text_field_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
