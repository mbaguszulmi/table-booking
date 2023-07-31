import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:table_booking/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titles = [
    "Table Booking",
    "Booking List",
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [
          TableRoute(),
          BookingListRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(titles[tabsRouter.activeIndex]),
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  label: "Tables",
                  icon: Icon(Icons.table_restaurant_rounded),
                ),
                BottomNavigationBarItem(
                  label: "Bookings",
                  icon: Icon(Icons.book_rounded),
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
            ),
          );
        });
  }
}
