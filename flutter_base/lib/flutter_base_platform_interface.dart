import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_base_method_channel.dart';

abstract class FlutterBasePlatform extends PlatformInterface {
  /// Constructs a FlutterBasePlatform.
  FlutterBasePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBasePlatform _instance = MethodChannelFlutterBase();

  /// The default instance of [FlutterBasePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBase].
  static FlutterBasePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBasePlatform] when
  /// they register themselves.
  static set instance(FlutterBasePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
