import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_base_platform_interface.dart';

/// An implementation of [FlutterBasePlatform] that uses method channels.
class MethodChannelFlutterBase extends FlutterBasePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_base');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
