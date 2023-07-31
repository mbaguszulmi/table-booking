import 'dart:async';

import 'package:flutter/foundation.dart';

import '../app_db.dart';
import '../entity/booking_time_entity.dart';
import 'seeder.dart';

class BookingTimeSeeder extends Seeder<AppDb> {
  @override
  FutureOr<void> seed() async {
    debugPrint("Seeding BookingTimeEntity data");
    db.bookingTimeDao.insert(List.generate(12, (index) {
      final startTime = "${index + 8}".padLeft(2, '0');
      final endTime = "${index + 9}".padLeft(2, '0');
      return BookingTimeEntity(index+1, "$startTime:00", "$endTime:00");
    }));
  }
}
