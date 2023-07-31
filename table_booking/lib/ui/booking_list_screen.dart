import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '../bloc/booking_list/booking_list_bloc.dart';
import '../router/app_router.dart';

@RoutePage()
class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingListBloc(),
      child: const _BookingListScreen(),
    );
  }
}

class _BookingListScreen extends StatefulWidget {
  const _BookingListScreen();

  @override
  State<_BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<_BookingListScreen> {
  late final BookingListBloc bookingListBloc;

  @override
  void initState() {
    super.initState();
    bookingListBloc = context.read<BookingListBloc>()..subscribe();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingListBloc, BookingListState>(
      builder: (context, state) {
        if (state is BookingListLoaded) {
          final bookings = state.bookings;

          return bookings.isEmpty
              ? const Center(child: Text("No bookings recorded"))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                              "${booking.tableName}: ${booking.customerName}"),
                          subtitle: Text(booking.schedule),
                          trailing: Icon(
                            booking.isCompleted
                                ? Icons.check
                                : Icons.lock_clock,
                          ),
                          onTap: () => booking.isCompleted
                              ? null
                              : booking.id?.let(
                                  (self) => AutoRouter.of(context)
                                      .navigate(BookingDetailRoute(id: self)),
                                ),
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                  itemCount: bookings.length,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  void dispose() {
    bookingListBloc.close();
    super.dispose();
  }
}
