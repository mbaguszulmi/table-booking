part of 'booking_details_bloc.dart';

class BookingDetailsLogic {
  final _bookingRepository = di<BookingRepository>();

  Future<void> loadBookingDetails(
    Emitter<BookingDetailsState> emit,
    int id,
  ) async {
    (await _bookingRepository.getBookingViewById(id))?.let((booking) {
      emit(BookingDetailsLoaded(booking));
    });
  }

  Future<void> deleteBooking(
    Emitter<BookingDetailsState> emit,
    BookingInfoEntity bookingInfo,
  ) async {
    await _bookingRepository.deleteData(bookingInfo);
    emit(const BookingDeleted());
  }
}
