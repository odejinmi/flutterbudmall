import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbudmall/flutterbudmall_method_channel.dart';
import 'package:flutterbudmall/flutterbudmall_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterbudmallPlatform
    with MockPlatformInterfaceMixin
    implements FlutterbudmallPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterbudmallPlatform initialPlatform =
      FlutterbudmallPlatform.instance;

  test('$MethodChannelFlutterbudmall is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterbudmall>());
  });

  test('getPlatformVersion', () async {
    // Flutterbudmall flutterbudmallPlugin = Flutterbudmall();
    MockFlutterbudmallPlatform fakePlatform = MockFlutterbudmallPlatform();
    FlutterbudmallPlatform.instance = fakePlatform;

    // expect(await flutterbudmallPlugin.getPlatformVersion(), '42');
  });
}
