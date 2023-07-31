part of 'booking_list_bloc.dart';

@immutable
abstract class BookingListEvent {
  const BookingListEvent();
}

class SubscribeBookingListEvent extends BookingListEvent {
  const SubscribeBookingListEvent(): super();
}

class LoadBookingListEvent extends BookingListEvent {
  final List<BookingInfoView> bookings;
  
  const LoadBookingListEvent(this.bookings): super();
}

class UnsubscribeBookingListEvent extends BookingListEvent {
  const UnsubscribeBookingListEvent(): super();
}
