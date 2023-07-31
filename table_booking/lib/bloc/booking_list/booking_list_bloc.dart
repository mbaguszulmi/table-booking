import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';
import 'package:table_booking/db/view/booking_info_view.dart';
import 'package:table_booking/repository/booking_repository.dart';

part 'booking_list_event.dart';
part 'booking_list_logic.dart';
part 'booking_list_state.dart';

class BookingListBloc extends Bloc<BookingListEvent, BookingListState> {
  BookingListBloc() : super(const BookingListInitial()) {
    final bookingListLogic = BookingListLogic();
    on<BookingListEvent>((event, emit) {
      if (event is SubscribeBookingListEvent) {
        bookingListLogic.subscribeBookingList(add);
      } else if (event is LoadBookingListEvent) {
        bookingListLogic.loadBookingList(emit, event.bookings);
      } else if (event is UnsubscribeBookingListEvent) {
        bookingListLogic.unsubscribeBookingList();
      }
    });
  }

  void subscribe() {
    add(const SubscribeBookingListEvent());
  }

  void unsubscribe() {
    add(const UnsubscribeBookingListEvent());
  }

  @override
  Future<void> close() {
    unsubscribe();
    return super.close();
  }
}
