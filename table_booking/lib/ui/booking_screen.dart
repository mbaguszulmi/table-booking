import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_booking/bloc/booking/booking_bloc.dart';
import 'package:table_booking/db/view/booking_time_view.dart';

import '../bloc/available_booking_time/available_booking_time_bloc.dart';

@RoutePage()
class BookingScreen extends StatelessWidget {
  final int tableId;
  final String tableName;
  const BookingScreen({
    super.key,
    @PathParam("tableId") required this.tableId,
    @PathParam("tableName") required this.tableName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AvailableBookingTimeBloc()),
        BlocProvider(create: (context) => BookingBloc()),
      ],
      child: _BookingScreen(
        tableId: tableId,
        tableName: tableName,
      ),
    );
  }
}

class _BookingScreen extends StatefulWidget {
  final int tableId;
  final String tableName;

  const _BookingScreen({required this.tableId, required this.tableName});

  @override
  State<_BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<_BookingScreen> {
  late final BookingBloc bookingBloc;
  BookingTimeView? selectedBookingTime;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AvailableBookingTimeBloc>().load(widget.tableId);
    bookingBloc = context.read<BookingBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        } else if (state is BookingSuccess) {
          AutoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Book Table ${widget.tableName}"),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                      labelText: "First Name",
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                      labelText: "Last Name",
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<AvailableBookingTimeBloc,
                      AvailableBookingTimeState>(
                    builder: (context, timeState) {
                      return DropdownButtonFormField<BookingTimeView>(
                        items: timeState is AvailableBookingTimeLoaded
                            ? timeState.availableBookingTimes
                                .map(
                                  (bookingTime) => DropdownMenuItem(
                                    value: bookingTime,
                                    child: Text(
                                      "${bookingTime.startTime} - ${bookingTime.endTime}",
                                    ),
                                  ),
                                )
                                .toList()
                            : List.empty(),
                        onChanged: (obj) {
                          selectedBookingTime = obj;
                        },
                        hint: const Text("Select Booking Time"),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      bookingBloc.book(
                        widget.tableId,
                        selectedBookingTime,
                        firstNameController.text,
                        lastNameController.text,
                        emailController.text,
                        phoneNumberController.text,
                      );
                    },
                    child: const Text("Book Table"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
