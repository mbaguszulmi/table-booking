import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/booking_detail_screen.dart';
import '../ui/booking_list_screen.dart';
import '../ui/booking_screen.dart';
import '../ui/home_screen.dart';
import '../ui/table_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/home",
          page: HomeRoute.page,
          initial: true,
          children: [
            RedirectRoute(path: '', redirectTo: 'table'),
            AutoRoute(
              path: "table",
              page: TableRoute.page,
            ),
            AutoRoute(
              path: "booking_list",
              page: BookingListRoute.page,
            )
          ],
        ),
        AutoRoute(
          path: "/booking/:tableId",
          page: BookingRoute.page,
        ),
        AutoRoute(
          path: "/booking_detail/:id",
          page: BookingDetailRoute.page,
        ),
      ];
}
