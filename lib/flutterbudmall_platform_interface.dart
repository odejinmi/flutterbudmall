import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutterbudmall_method_channel.dart';

abstract class FlutterbudmallPlatform extends PlatformInterface {
  /// Constructs a FlutterbudmallPlatform.
  FlutterbudmallPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterbudmallPlatform _instance = MethodChannelFlutterbudmall();

  /// The default instance of [FlutterbudmallPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterbudmall].
  static FlutterbudmallPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterbudmallPlatform] when
  /// they register themselves.
  static set instance(FlutterbudmallPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
