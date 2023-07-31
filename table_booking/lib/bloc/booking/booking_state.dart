part of 'booking_bloc.dart';

@immutable
abstract class BookingState {
  const BookingState();
}

class BookingInitial extends BookingState {
  const BookingInitial() : super();
}

class BookingError extends BookingState {
  final String error;

  const BookingError(this.error) : super();
}

class BookingSuccess extends BookingState {
  const BookingSuccess() : super();
}
