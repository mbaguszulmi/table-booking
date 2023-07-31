part of 'booking_details_bloc.dart';

@immutable
abstract class BookingDetailsEvent {
  const BookingDetailsEvent();
}

class LoadBookingDetailsEvent extends BookingDetailsEvent {
  final int id;

  const LoadBookingDetailsEvent(this.id) : super();
}

class DeleteBookingEvent extends BookingDetailsEvent {
  final BookingInfoEntity bookingInfo;

  const DeleteBookingEvent(this.bookingInfo) : super();
}
