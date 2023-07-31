import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/booking_details/booking_details_bloc.dart';

@RoutePage()
class BookingDetailScreen extends StatelessWidget {
  final int id;
  const BookingDetailScreen({super.key, @PathParam("id") required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingDetailsBloc(),
      child: _BookingDetailScreen(id: id),
    );
  }
}

class _BookingDetailScreen extends StatefulWidget {
  final int id;

  const _BookingDetailScreen({required this.id});

  @override
  State<_BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<_BookingDetailScreen> {
  late final BookingDetailsBloc bookingDetailsBloc;

  @override
  void initState() {
    super.initState();
    bookingDetailsBloc = context.read<BookingDetailsBloc>()
      ..loadBookingDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Details")),
      body: BlocConsumer<BookingDetailsBloc, BookingDetailsState>(
        listener: (context, state) {
          if (state is BookingDeleted) {
            AutoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is BookingDetailsLoaded) {
            final booking = state.bookingInfo;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    _buildTextLabel("Table", booking.tableName),
                    _buildTextLabel("Name", booking.customerName),
                    _buildTextLabel("Email", booking.email),
                    _buildTextLabel("Phone Number", booking.phoneNumber),
                    _buildTextLabel("Booking Schedule", booking.schedule),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        revealDialog(
                          context: context,
                          titleText: "Warning!",
                          bodyText:
                              "Are you want to delete this booking information?",
                          negativeText: "Yes",
                          positiveText: "No",
                          onNegativeClicked: () {
                            bookingDetailsBloc.deleteBookingDetails(booking);
                            AutoRouter.of(context).pop();
                          },
                          onPositiveClicked: () => AutoRouter.of(context).pop(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                      child: Text(
                        "Delete Booking",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onError,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildTextLabel(String label, String content) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(content),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
