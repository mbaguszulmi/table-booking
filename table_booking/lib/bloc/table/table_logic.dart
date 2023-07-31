part of 'table_bloc.dart';

class TableLogic {
  final _tableRepository = di<TableRepository>();
  StreamSubscription<List<TableView>>? _tableSubscription;

  void subscribeTable(
    void Function(TableEvent event) add,
  ) async {
    _tableSubscription?.cancel();
    _tableSubscription = _tableRepository.getTableViews().listen((tables) {
      add(LoadTableEvent(tables));
    });
  }

  void unsubscribeTable() {
    _tableSubscription?.cancel();
    _tableSubscription = null;
  }

  void loadTable(Emitter<TableState> emit, List<TableView> tables) {
    emit(TableLoaded(tables: tables));
  }
}
