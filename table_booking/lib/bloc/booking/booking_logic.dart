part of 'booking_bloc.dart';

class BookingLogic {
  final bookingRepository = di<BookingRepository>();

  Future<void> book(Emitter<BookingState> emit, BookingSendEvent event) async {
    final bookingTime = event.bookingTime;
    if (bookingTime == null) {
      return emit(const BookingError("Please select a booking time"));
    } else if (event.firstName.trim().isEmpty) {
      return emit(const BookingError("First name is required"));
    } else if (event.lastName.trim().isEmpty) {
      return emit(const BookingError("Last name is required"));
    } else if (event.email.trim().isEmpty) {
      return emit(const BookingError("Email is required"));
    } else if (!isEmailValid(event.email.trim())) {
      return emit(const BookingError("Email is invalid"));
    } else if (event.phoneNumber.trim().isEmpty) {
      return emit(const BookingError("Phone number is required"));
    } else if (!isPhoneNumberValid(event.phoneNumber)) {
      return emit(const BookingError("Phone number is invalid"));
    }

    await bookingRepository.insert(BookingInfoEntity(
      null,
      event.firstName,
      event.lastName,
      event.email,
      event.phoneNumber,
      bookingTime.id,
      bookingTime.startDate,
      bookingTime.endDate,
      event.tableId,
      DateTime.now().second,
      DateTime.now().second,
    ));

    emit(const BookingSuccess());
  }
}
