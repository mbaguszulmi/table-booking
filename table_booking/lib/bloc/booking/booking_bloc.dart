import 'package:bloc/bloc.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:meta/meta.dart';
import 'package:table_booking/db/entity/booking_info_entity.dart';
import 'package:table_booking/db/view/booking_time_view.dart';

import '../../repository/booking_repository.dart';

part 'booking_event.dart';
part 'booking_logic.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(const BookingInitial()) {
    final bookingLogic = BookingLogic();

    on<BookingEvent>((event, emit) async {
      if (event is BookingSendEvent) {
        await bookingLogic.book(emit, event);
      }
    });
  }

  void book(
    int tableId,
    BookingTimeView? bookingTime,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
  ) {
    add(BookingSendEvent(
      tableId,
      bookingTime,
      firstName,
      lastName,
      email,
      phoneNumber,
    ));
  }
}
