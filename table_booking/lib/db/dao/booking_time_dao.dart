import 'package:floor/floor.dart';

import '../entity/booking_time_entity.dart';
import '../view/booking_time_view.dart';

@dao
abstract class BookingTimeDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(List<BookingTimeEntity> bookingTimes);

  @Query(
    "SELECT * FROM BookingTimeView btv "
    "WHERE id NOT IN ("
    "SELECT bookingTimeId FROM BookingInfoEntity "
    "WHERE startDate >= strftime('%s', 'now') AND tableId = :tableId)"
    "AND btv.startDate >= cast(strftime('%s', 'now') as INT)",
  )
  Future<List<BookingTimeView>> getAvailableBookingTime(int tableId);
}
