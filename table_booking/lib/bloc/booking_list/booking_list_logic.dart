part of 'booking_list_bloc.dart';

class BookingListLogic {
  final _bookingRepository = di<BookingRepository>();
  StreamSubscription<List<BookingInfoView>>? _bookingListSubscription;

  void subscribeBookingList(void Function(BookingListEvent event) add) {
    _bookingListSubscription?.cancel();
    _bookingListSubscription = _bookingRepository.getBookingViews().listen(
      (bookings) {
        add(LoadBookingListEvent(bookings));
      },
    );
  }

  void loadBookingList(
    Emitter<BookingListState> emit,
    List<BookingInfoView> bookings,
  ) {
    emit(BookingListLoaded(bookings: bookings));
  }

  void unsubscribeBookingList() {
    _bookingListSubscription?.cancel();
    _bookingListSubscription = null;
  }
}
