import 'package:bloc/bloc.dart';
import 'package:flutter_base/di.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:meta/meta.dart';

import '../../db/entity/booking_info_entity.dart';
import '../../db/view/booking_info_view.dart';
import '../../repository/booking_repository.dart';

part 'booking_details_event.dart';
part 'booking_details_logic.dart';
part 'booking_details_state.dart';

class BookingDetailsBloc
    extends Bloc<BookingDetailsEvent, BookingDetailsState> {
  BookingDetailsBloc() : super(const BookingDetailsInitial()) {
    final bookingDetailsLogic = BookingDetailsLogic();
    on<BookingDetailsEvent>((event, emit) async {
      if (event is LoadBookingDetailsEvent) {
        await bookingDetailsLogic.loadBookingDetails(emit, event.id);
      } else if (event is DeleteBookingEvent) {
        await bookingDetailsLogic.deleteBooking(emit, event.bookingInfo);
      }
    });
  }

  void loadBookingDetails(int id) {
    add(LoadBookingDetailsEvent(id));
  }

  void deleteBookingDetails(BookingInfoEntity bookingInfo) {
    add(DeleteBookingEvent(bookingInfo));
  }
}
