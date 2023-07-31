part of 'available_booking_time_bloc.dart';

@immutable
abstract class AvailableBookingTimeEvent {
  const AvailableBookingTimeEvent();
}

class LoadAvailableBookingTimeEvent extends AvailableBookingTimeEvent {
  final int tableId;

  const LoadAvailableBookingTimeEvent(this.tableId) : super();
}
