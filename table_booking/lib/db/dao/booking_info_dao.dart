import 'package:floor/floor.dart';

import '../entity/booking_info_entity.dart';
import '../view/booking_info_view.dart';

@dao
abstract class BookingInfoDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(BookingInfoEntity bookingInfo);

  @Query("SELECT * FROM BookingInfoEntity ORDER BY startDate DESC")
  Stream<List<BookingInfoEntity>> getBookings();

  @Query("SELECT * FROM BookingInfoView ORDER BY startDate DESC")
  Stream<List<BookingInfoView>> getBookingViews();

  @Query("SELECT * FROM BookingInfoEntity WHERE id = :id")
  Future<BookingInfoEntity?> getBookingById(int id);

  @Query("SELECT * FROM BookingInfoView WHERE id = :id")
  Future<BookingInfoView?> getBookingViewById(int id);

  @Update()
  Future<void> _update(BookingInfoEntity bookingInfo);

  Future<void> update(BookingInfoEntity bookingInfo) =>
      _update(bookingInfo..updatedDate = DateTime.now().second);

  @delete
  Future<void> deleteData(BookingInfoEntity bookingInfo);
}
