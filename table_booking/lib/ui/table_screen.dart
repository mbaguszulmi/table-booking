import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_booking/router/app_router.dart';

import '../bloc/table/table_bloc.dart';

@RoutePage()
class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableBloc(),
      child: const _TableScreen(),
    );
  }
}

class _TableScreen extends StatefulWidget {
  const _TableScreen();

  @override
  State<_TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<_TableScreen> {
  late final TableBloc tableBloc;

  @override
  void initState() {
    super.initState();

    tableBloc = context.read<TableBloc>()..subscribeTable();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        if (state is TableLoaded) {
          final tables = state.tables;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final table = tables[index];
              final theme = Theme.of(context);

              return GestureDetector(
                child: Card(
                  color: table.isAvailable
                      ? theme.cardColor
                      : theme.primaryColorDark,
                  child: Center(
                    child: Text(
                      table.name,
                      style: TextStyle(
                        color: table.isAvailable ? null : theme.disabledColor,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (table.isAvailable) {
                    AutoRouter.of(context).navigate(
                      BookingRoute(tableId: table.id, tableName: table.name),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Fully booked"),
                      ),
                    );
                  }
                },
              );
            },
            itemCount: tables.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  void dispose() {
    tableBloc.close();
    super.dispose();
  }
}
