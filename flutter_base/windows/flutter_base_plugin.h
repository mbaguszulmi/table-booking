#ifndef FLUTTER_PLUGIN_FLUTTER_BASE_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_BASE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_base {

class FlutterBasePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterBasePlugin();

  virtual ~FlutterBasePlugin();

  // Disallow copy and assign.
  FlutterBasePlugin(const FlutterBasePlugin&) = delete;
  FlutterBasePlugin& operator=(const FlutterBasePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_base

#endif  // FLUTTER_PLUGIN_FLUTTER_BASE_PLUGIN_H_
