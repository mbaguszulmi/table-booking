import 'package:bloc/bloc.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';

import '../../db/view/booking_time_view.dart';
import '../../repository/booking_repository.dart';

part 'available_booking_time_event.dart';
part 'available_booking_time_logic.dart';
part 'available_booking_time_state.dart';

class AvailableBookingTimeBloc
    extends Bloc<AvailableBookingTimeEvent, AvailableBookingTimeState> {
  AvailableBookingTimeBloc() : super(const AvailableBookingTimeInitial()) {
    final availableBookingTimeLogic = AvailableBookingTimeLogic();

    on<AvailableBookingTimeEvent>((event, emit) async {
      if (event is LoadAvailableBookingTimeEvent) {
        await availableBookingTimeLogic.loadAvailableBookingTime(
          event.tableId,
          emit,
        );
      }
    });
  }

  void load(int tableId) {
    add(LoadAvailableBookingTimeEvent(tableId));
  }
}
