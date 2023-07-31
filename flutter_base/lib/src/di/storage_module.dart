import 'package:flutter_base/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void initializeStorageModule() {
  _provideSharedPreferences();
}

void _provideSharedPreferences() {
  di.registerSingletonAsync(() async => await SharedPreferences.getInstance());
}
