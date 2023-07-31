part of 'booking_details_bloc.dart';

@immutable
abstract class BookingDetailsState {
  const BookingDetailsState();
}

class BookingDetailsInitial extends BookingDetailsState {
  const BookingDetailsInitial() : super();
}

class BookingDetailsLoaded extends BookingDetailsState {
  final BookingInfoView bookingInfo;

  const BookingDetailsLoaded(this.bookingInfo) : super();
}

class BookingDeleted extends BookingDetailsState {
  const BookingDeleted(): super();
}
