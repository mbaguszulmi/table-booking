part of 'booking_list_bloc.dart';

@immutable
abstract class BookingListState {
  const BookingListState();
}

class BookingListInitial extends BookingListState {
  const BookingListInitial() : super();
}

class BookingListLoaded extends BookingListState {
  final List<BookingInfoView> bookings;
  
  const BookingListLoaded({
    this.bookings = const [],
  }) : super();
}
