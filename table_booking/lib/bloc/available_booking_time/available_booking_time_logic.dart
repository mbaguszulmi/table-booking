part of 'available_booking_time_bloc.dart';

class AvailableBookingTimeLogic {
  final _bookingRepository = di<BookingRepository>();

  Future<void> loadAvailableBookingTime(
    int tableId,
    Emitter<AvailableBookingTimeState> emit,
  ) async {
    emit(
      AvailableBookingTimeLoaded(
        tableId,
        availableBookingTimes: await _bookingRepository.getAvailableBookingTime(
          tableId,
        ),
      ),
    );
  }
}
