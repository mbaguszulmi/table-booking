#include "include/flutter_base/flutter_base_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_base_plugin.h"

void FlutterBasePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_base::FlutterBasePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
