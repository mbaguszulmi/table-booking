import 'package:floor/floor.dart';

import '../entity/booking_time_entity.dart';

@DatabaseView(
  "SELECT *, "
  "unixepoch(strftime('%Y-%m-%d', 'now', 'localtime') || ' ' || startTime, 'utc') as startDate,"
  "unixepoch(strftime('%Y-%m-%d', 'now', 'localtime') || ' ' || endTime, 'utc') as endDate "
  "FROM BookingTimeEntity",
)
class BookingTimeView extends BookingTimeEntity {
  final int startDate;
  final int endDate;

  BookingTimeView(
    super.id,
    super.startTime,
    super.endTime,
    this.startDate,
    this.endDate,
  );
}
