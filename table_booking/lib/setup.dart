import 'package:table_booking/di/repository_module.dart';

import 'di/db_module.dart';

class App {
  static void setup() {
    setupDbModule();
    setupRepositoryModule();
  }
}