import 'dart:async';

import 'package:flutter/foundation.dart';

import '../app_db.dart';
import '../entity/table_entity.dart';
import 'seeder.dart';

class TableSeeder extends Seeder<AppDb> {
  @override
  FutureOr<void> seed() async {
    debugPrint("Seeding TableEntity data");
    
    await db.tableDao.insert(List.generate(15, (index) {
      final id = index + 1;
      return TableEntity(id, "$id".padLeft(2, '0'));
    }));
  }
}
