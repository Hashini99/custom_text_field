import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'custom_text_field_plugin_method_channel.dart';

abstract class CustomTextFieldPluginPlatform extends PlatformInterface {
  /// Constructs a CustomTextFieldPluginPlatform.
  CustomTextFieldPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomTextFieldPluginPlatform _instance =
      MethodChannelCustomTextFieldPlugin();

  /// The default instance of [CustomTextFieldPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomTextFieldPlugin].
  static CustomTextFieldPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomTextFieldPluginPlatform] when
  /// they register themselves.
  static set instance(CustomTextFieldPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
