import 'package:flutter_base/flutter_base.dart';

import '../db/dao/booking_info_dao.dart';
import '../db/dao/booking_time_dao.dart';
import '../db/dao/table_dao.dart';
import '../repository/booking_repository.dart';
import '../repository/table_repository.dart';

void setupRepositoryModule() {
  di.registerSingletonWithDependencies(
    () => TableRepository(),
    dependsOn: [TableDao],
  );
  di.registerSingletonWithDependencies(
    () => BookingRepository(),
    dependsOn: [BookingInfoDao, BookingTimeDao],
  );
}
