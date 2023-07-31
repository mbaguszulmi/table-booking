import 'package:flutter_base/di.dart';
import 'package:table_booking/db/dao/table_dao.dart';
import 'package:table_booking/db/entity/table_entity.dart';

import '../db/view/table_view.dart';

class TableRepository {
  final tableDao = di<TableDao>();

  Stream<List<TableEntity>> getTables() => tableDao.getTables();

  Stream<List<TableView>> getTableViews() => tableDao.getTableViews();
}
