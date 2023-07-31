import 'package:flutter_base/di.dart';

import '../db/dao/booking_info_dao.dart';
import '../db/dao/booking_time_dao.dart';
import '../db/entity/booking_info_entity.dart';
import '../db/view/booking_info_view.dart';
import '../db/view/booking_time_view.dart';

class BookingRepository {
  final bookingInfoDao = di<BookingInfoDao>();
  final bookingTimeDao = di<BookingTimeDao>();

  Future<void> insert(BookingInfoEntity bookingInfo) =>
      bookingInfoDao.insert(bookingInfo);

  Stream<List<BookingInfoEntity>> getBookings() => bookingInfoDao.getBookings();

  Stream<List<BookingInfoView>> getBookingViews() =>
      bookingInfoDao.getBookingViews();

  Future<BookingInfoEntity?> getBookingById(int id) =>
      bookingInfoDao.getBookingById(id);

  Future<BookingInfoView?> getBookingViewById(int id) =>
      bookingInfoDao.getBookingViewById(id);

  Future<void> update(BookingInfoEntity bookingInfo) =>
      bookingInfoDao.update(bookingInfo);

  Future<void> deleteData(BookingInfoEntity bookingInfo) =>
      bookingInfoDao.deleteData(bookingInfo);

  Future<List<BookingTimeView>> getAvailableBookingTime(int tableId) =>
      bookingTimeDao.getAvailableBookingTime(tableId);
}
