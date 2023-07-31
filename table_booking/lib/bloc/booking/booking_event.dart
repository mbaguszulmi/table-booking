part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {
  const BookingEvent();
}

class BookingSendEvent extends BookingEvent {
  final int tableId;
  final BookingTimeView? bookingTime;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const BookingSendEvent(this.tableId, this.bookingTime, this.firstName, this.lastName, this.email, this.phoneNumber);
}
