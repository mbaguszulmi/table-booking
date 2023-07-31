part of 'table_bloc.dart';

@immutable
abstract class TableEvent {
  const TableEvent();
}

class SubscribeTableEvent extends TableEvent {
  const SubscribeTableEvent(): super();
}

class LoadTableEvent extends TableEvent {
  final List<TableView> tables;

  const LoadTableEvent(this.tables): super();
}

class UnsubscribeTableEvent extends TableEvent {
  const UnsubscribeTableEvent(): super();
}
