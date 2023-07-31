part of 'available_booking_time_bloc.dart';

@immutable
abstract class AvailableBookingTimeState {
  const AvailableBookingTimeState();
}

class AvailableBookingTimeInitial extends AvailableBookingTimeState {
  const AvailableBookingTimeInitial() : super();
}

class AvailableBookingTimeLoaded extends AvailableBookingTimeState {
  final int tableId;
  final List<BookingTimeView> availableBookingTimes;

  const AvailableBookingTimeLoaded(
    this.tableId, {
    this.availableBookingTimes = const [],
  }) : super();
}
