import 'package:floor/floor.dart';

import '../entity/table_entity.dart';

@DatabaseView(
  "SELECT *, "
  "CASE "
  "WHEN "
  "("
  "SELECT COUNT(id) FROM BookingTimeView btv "
  "WHERE id NOT IN ("
  "SELECT bookingTimeId FROM BookingInfoEntity "
  "WHERE startDate >= strftime('%s', 'now') AND tableId = t.id) "
  "AND btv.startDate >= cast(strftime('%s', 'now') as INT)) > 0 THEN 1 "
  "ELSE 0 "
  "END isAvailable "
  "FROM TableEntity t",
)
class TableView extends TableEntity {
  final bool isAvailable;

  TableView(super.id, super.name, this.isAvailable);
}
