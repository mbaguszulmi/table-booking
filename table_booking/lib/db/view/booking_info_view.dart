import 'package:floor/floor.dart';
import 'package:flutter_base/flutter_base.dart';

import '../entity/booking_info_entity.dart';

@DatabaseView(
  "SELECT bi.*, t.name as tableName FROM BookingInfoEntity bi "
  "JOIN TableEntity t ON bi.tableId = t.id",
)
class BookingInfoView extends BookingInfoEntity {
  final String tableName;

  String get customerName => "$firstName $lastName";

  String get schedule =>
      "${DateHelper.formatDate(DateTime.fromMillisecondsSinceEpoch(startDate * 1000))} "
      "(${DateHelper.formatTime(DateTime.fromMillisecondsSinceEpoch(startDate * 1000))} "
      "- ${DateHelper.formatTime(DateTime.fromMillisecondsSinceEpoch(endDate * 1000))})";

  bool get isCompleted => DateTime.fromMillisecondsSinceEpoch(endDate * 1000).isBefore(DateTime.now());

  BookingInfoView(
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    super.phoneNumber,
    super.bookingTimeId,
    super.startDate,
    super.endDate,
    super.tableId,
    super.createdDate,
    super.updatedDate,
    this.tableName,
  );
}
