import 'package:flutter_test/flutter_test.dart';
import 'package:custom_text_field_plugin/custom_text_field_plugin.dart';
import 'package:custom_text_field_plugin/custom_text_field_plugin_platform_interface.dart';
import 'package:custom_text_field_plugin/custom_text_field_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomTextFieldPluginPlatform
    with MockPlatformInterfaceMixin
    implements CustomTextFieldPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CustomTextFieldPluginPlatform initialPlatform =
      CustomTextFieldPluginPlatform.instance;

  test('$MethodChannelCustomTextFieldPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomTextFieldPlugin>());
  });

  test('getPlatformVersion', () async {
    CustomTextFieldPlugin customTextFieldPlugin = CustomTextFieldPlugin();
    MockCustomTextFieldPluginPlatform fakePlatform =
        MockCustomTextFieldPluginPlatform();
    CustomTextFieldPluginPlatform.instance = fakePlatform;

    expect(await customTextFieldPlugin.getPlatformVersion(), '42');
  });
}
