import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';

import '../../db/view/table_view.dart';
import '../../repository/table_repository.dart';

part 'table_event.dart';
part 'table_logic.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc() : super(const TableInitial()) {
    final tableLogic = TableLogic();

    on<TableEvent>((event, emit) {
      if (event is SubscribeTableEvent) {
        tableLogic.subscribeTable(add);
      } else if (event is LoadTableEvent) {
        tableLogic.loadTable(emit, event.tables);
      } else if (event is UnsubscribeTableEvent) {
        tableLogic.unsubscribeTable();
      }
    });
  }

  void subscribeTable() {
    add(const SubscribeTableEvent());
  }

  void unsubscribeTable() {
    add(const UnsubscribeTableEvent());
  }

  @override
  Future<void> close() {
    unsubscribeTable();
    return super.close();
  }
}
