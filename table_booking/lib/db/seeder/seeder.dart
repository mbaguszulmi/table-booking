import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_base/di.dart';
import 'package:meta/meta.dart';

abstract class Seeder<T extends FloorDatabase> {

  final T _db = di<T>();

  @protected
  T get db => _db;

  FutureOr<void> seed();

}