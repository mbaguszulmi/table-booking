// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    TableRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TableScreen(),
      );
    },
    BookingListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingListScreen(),
      );
    },
    BookingRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookingRouteArgs>(
          orElse: () => BookingRouteArgs(
                tableId: pathParams.getInt('tableId'),
                tableName: pathParams.getString('tableName'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookingScreen(
          key: args.key,
          tableId: args.tableId,
          tableName: args.tableName,
        ),
      );
    },
    BookingDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookingDetailRouteArgs>(
          orElse: () => BookingDetailRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookingDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TableScreen]
class TableRoute extends PageRouteInfo<void> {
  const TableRoute({List<PageRouteInfo>? children})
      : super(
          TableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TableRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingListScreen]
class BookingListRoute extends PageRouteInfo<void> {
  const BookingListRoute({List<PageRouteInfo>? children})
      : super(
          BookingListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingScreen]
class BookingRoute extends PageRouteInfo<BookingRouteArgs> {
  BookingRoute({
    Key? key,
    required int tableId,
    required String tableName,
    List<PageRouteInfo>? children,
  }) : super(
          BookingRoute.name,
          args: BookingRouteArgs(
            key: key,
            tableId: tableId,
            tableName: tableName,
          ),
          rawPathParams: {
            'tableId': tableId,
            'tableName': tableName,
          },
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const PageInfo<BookingRouteArgs> page =
      PageInfo<BookingRouteArgs>(name);
}

class BookingRouteArgs {
  const BookingRouteArgs({
    this.key,
    required this.tableId,
    required this.tableName,
  });

  final Key? key;

  final int tableId;

  final String tableName;

  @override
  String toString() {
    return 'BookingRouteArgs{key: $key, tableId: $tableId, tableName: $tableName}';
  }
}

/// generated route for
/// [BookingDetailScreen]
class BookingDetailRoute extends PageRouteInfo<BookingDetailRouteArgs> {
  BookingDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          BookingDetailRoute.name,
          args: BookingDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'BookingDetailRoute';

  static const PageInfo<BookingDetailRouteArgs> page =
      PageInfo<BookingDetailRouteArgs>(name);
}

class BookingDetailRouteArgs {
  const BookingDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'BookingDetailRouteArgs{key: $key, id: $id}';
  }
}
