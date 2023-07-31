import 'package:floor/floor.dart';

import '../entity/table_entity.dart';
import '../view/table_view.dart';

@dao
abstract class TableDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(List<TableEntity> tables);

  @Query("SELECT * FROM TableEntity")
  Stream<List<TableEntity>> getTables();

  @Query("SELECT * FROM TableView")
  Stream<List<TableView>> getTableViews();
}
