import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @optionalTypeArgs
  static Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed<T>(routeName, arguments: arguments);
  }

  @optionalTypeArgs
  static String restorablePushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.restorablePushNamed(
      routeName,
      arguments: arguments,
    ) ?? '';
  }

  @optionalTypeArgs
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) async {
    return navigatorKey.currentState?.pushReplacementNamed<T, TO>(routeName,
        result: result, arguments: arguments);
  }

  @optionalTypeArgs
  static String
      restorablePushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.restorablePushReplacementNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments) ?? '';
  }

  @optionalTypeArgs
  static Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) async {
    return navigatorKey.currentState?.popAndPushNamed<T, TO>(routeName,
        result: result, arguments: arguments);
  }

  @optionalTypeArgs
  static String restorablePopAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.restorablePopAndPushNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments) ?? '';
  }

  @optionalTypeArgs
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
        newRouteName, predicate,
        arguments: arguments);
  }

  @optionalTypeArgs
  static String restorablePushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.restorablePushNamedAndRemoveUntil<T>(
        newRouteName, predicate,
        arguments: arguments) ?? '';
  }

  @optionalTypeArgs
  static Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) {
    return pushNamedAndRemoveUntil(newRouteName, (route) => false, arguments: arguments);
  }

  @optionalTypeArgs
  static String restorablePushNamedAndRemoveAll<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return restorablePushNamedAndRemoveUntil(newRouteName, (route) => false, arguments: arguments);
  }

  @optionalTypeArgs
  static Future<T?> push<T extends Object?>(Route<T> route) async {
    return navigatorKey.currentState?.push(route);
  }

  @optionalTypeArgs
  static String restorablePush<T extends Object?>(
      RestorableRouteBuilder<T> routeBuilder,
      {Object? arguments}) {
    return navigatorKey.currentState
        ?.restorablePush(routeBuilder, arguments: arguments) ?? '';
  }

  @optionalTypeArgs
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Route<T> newRoute,
      {TO? result}) async {
    return navigatorKey.currentState?.pushReplacement(newRoute, result: result);
  }

  @optionalTypeArgs
  static String restorablePushReplacement<T extends Object?, TO extends Object?>(
      RestorableRouteBuilder<T> routeBuilder,
      {TO? result,
      Object? arguments}) {
    return navigatorKey.currentState?.restorablePushReplacement(routeBuilder,
        result: result, arguments: arguments) ?? '';
  }

  @optionalTypeArgs
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
      Route<T> newRoute, RoutePredicate predicate) async {
    return navigatorKey.currentState?.pushAndRemoveUntil(newRoute, predicate);
  }

  @optionalTypeArgs
  static String restorablePushAndRemoveUntil<T extends Object?>(
      RestorableRouteBuilder<T> newRouteBuilder, RoutePredicate predicate,
      {Object? arguments}) {
    return navigatorKey.currentState?.restorablePushAndRemoveUntil(
        newRouteBuilder, predicate,
        arguments: arguments) ?? '';
  }

  @optionalTypeArgs
  static void pop<T extends Object?>([ T? result ]) {
    navigatorKey.currentState?.pop(result);
  }

  static void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState?.popUntil(predicate);
  }

  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  @optionalTypeArgs
  Future<bool> maybePop<T extends Object?>([ T? result ]) async {
    return await navigatorKey.currentState?.maybePop(result) ?? false;
  }
}
