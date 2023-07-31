import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:table_booking/db/dao/booking_time_dao.dart';

import 'dao/booking_info_dao.dart';
import 'dao/table_dao.dart';
import 'entity/booking_info_entity.dart';
import 'entity/booking_time_entity.dart';
import 'entity/table_entity.dart';
import 'view/booking_info_view.dart';
import 'view/booking_time_view.dart';
import 'view/table_view.dart';

part 'app_db.g.dart';

const dbName = "app_db.db";

@Database(
  version: 1,
  entities: [TableEntity, BookingInfoEntity, BookingTimeEntity],
  views: [BookingInfoView, TableView, BookingTimeView],
)
abstract class AppDb extends FloorDatabase {
  TableDao get tableDao;
  BookingInfoDao get bookingInfoDao;
  BookingTimeDao get bookingTimeDao;
}
