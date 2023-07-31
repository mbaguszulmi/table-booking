part of 'table_bloc.dart';

@immutable
abstract class TableState {
  const TableState();
}

class TableInitial extends TableState {
  const TableInitial() : super();
}

class TableLoaded extends TableState {
  final List<TableView> tables;

  const TableLoaded({
    this.tables = const [],
  }) : super();
}
