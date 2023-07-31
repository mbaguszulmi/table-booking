import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/di.dart';

import '../db/app_db.dart';
import '../db/seeder/booking_time_seeder.dart';
import '../db/seeder/table_seeder.dart';

void _provideDatabase() {
  di.registerSingletonAsync(
      () => $FloorAppDb.databaseBuilder(dbName).addCallback(Callback(
            onCreate: (database, version) {
              () async {
                debugPrint("Database path: ${database.path}");
                await di.allReady();
                await di<TableSeeder>().seed();
                await di<BookingTimeSeeder>().seed();
              }();
            },
          )).build());
}

void _provideSeeder() {
  di.registerSingletonWithDependencies(
    () => TableSeeder(),
    dependsOn: [AppDb],
  );

  di.registerSingletonWithDependencies(
    () => BookingTimeSeeder(),
    dependsOn: [AppDb],
  );
}

void _provideDaos() {
  di.registerSingletonWithDependencies(
    () => di<AppDb>().tableDao,
    dependsOn: [AppDb],
  );
  di.registerSingletonWithDependencies(
    () => di<AppDb>().bookingInfoDao,
    dependsOn: [AppDb],
  );

  di.registerSingletonWithDependencies(
    () => di<AppDb>().bookingTimeDao,
    dependsOn: [AppDb],
  );
}

void setupDbModule() {
  _provideDatabase();
  _provideSeeder();
  _provideDaos();
}
