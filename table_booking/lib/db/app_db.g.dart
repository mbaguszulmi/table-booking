// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder databaseBuilder(String name) => _$AppDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder inMemoryDatabaseBuilder() => _$AppDbBuilder(null);
}

class _$AppDbBuilder {
  _$AppDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDb extends AppDb {
  _$AppDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TableDao? _tableDaoInstance;

  BookingInfoDao? _bookingInfoDaoInstance;

  BookingTimeDao? _bookingTimeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TableEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BookingInfoEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `email` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `bookingTimeId` INTEGER NOT NULL, `startDate` INTEGER NOT NULL, `endDate` INTEGER NOT NULL, `tableId` INTEGER NOT NULL, `createdDate` INTEGER NOT NULL, `updatedDate` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BookingTimeEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `startTime` TEXT NOT NULL, `endTime` TEXT NOT NULL)');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `BookingInfoView` AS SELECT bi.*, t.name as tableName FROM BookingInfoEntity bi JOIN TableEntity t ON bi.tableId = t.id');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `TableView` AS SELECT *, CASE WHEN (SELECT COUNT(id) FROM BookingTimeView btv WHERE id NOT IN (SELECT bookingTimeId FROM BookingInfoEntity WHERE startDate >= strftime(\'%s\', \'now\') AND tableId = t.id) AND btv.startDate >= cast(strftime(\'%s\', \'now\') as INT)) > 0 THEN 1 ELSE 0 END isAvailable FROM TableEntity t');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `BookingTimeView` AS SELECT *, unixepoch(strftime(\'%Y-%m-%d\', \'now\', \'localtime\') || \' \' || startTime, \'utc\') as startDate,unixepoch(strftime(\'%Y-%m-%d\', \'now\', \'localtime\') || \' \' || endTime, \'utc\') as endDate FROM BookingTimeEntity');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TableDao get tableDao {
    return _tableDaoInstance ??= _$TableDao(database, changeListener);
  }

  @override
  BookingInfoDao get bookingInfoDao {
    return _bookingInfoDaoInstance ??=
        _$BookingInfoDao(database, changeListener);
  }

  @override
  BookingTimeDao get bookingTimeDao {
    return _bookingTimeDaoInstance ??=
        _$BookingTimeDao(database, changeListener);
  }
}

class _$TableDao extends TableDao {
  _$TableDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _tableEntityInsertionAdapter = InsertionAdapter(
            database,
            'TableEntity',
            (TableEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TableEntity> _tableEntityInsertionAdapter;

  @override
  Stream<List<TableEntity>> getTables() {
    return _queryAdapter.queryListStream('SELECT * FROM TableEntity',
        mapper: (Map<String, Object?> row) =>
            TableEntity(row['id'] as int, row['name'] as String),
        queryableName: 'TableEntity',
        isView: false);
  }

  @override
  Stream<List<TableView>> getTableViews() {
    return _queryAdapter.queryListStream('SELECT * FROM TableView',
        mapper: (Map<String, Object?> row) => TableView(row['id'] as int,
            row['name'] as String, (row['isAvailable'] as int) != 0),
        queryableName: 'TableView',
        isView: true);
  }

  @override
  Future<void> insert(List<TableEntity> tables) async {
    await _tableEntityInsertionAdapter.insertList(
        tables, OnConflictStrategy.replace);
  }
}

class _$BookingInfoDao extends BookingInfoDao {
  _$BookingInfoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _bookingInfoEntityInsertionAdapter = InsertionAdapter(
            database,
            'BookingInfoEntity',
            (BookingInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'phoneNumber': item.phoneNumber,
                  'bookingTimeId': item.bookingTimeId,
                  'startDate': item.startDate,
                  'endDate': item.endDate,
                  'tableId': item.tableId,
                  'createdDate': item.createdDate,
                  'updatedDate': item.updatedDate
                },
            changeListener),
        _bookingInfoEntityUpdateAdapter = UpdateAdapter(
            database,
            'BookingInfoEntity',
            ['id'],
            (BookingInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'phoneNumber': item.phoneNumber,
                  'bookingTimeId': item.bookingTimeId,
                  'startDate': item.startDate,
                  'endDate': item.endDate,
                  'tableId': item.tableId,
                  'createdDate': item.createdDate,
                  'updatedDate': item.updatedDate
                },
            changeListener),
        _bookingInfoEntityDeletionAdapter = DeletionAdapter(
            database,
            'BookingInfoEntity',
            ['id'],
            (BookingInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'email': item.email,
                  'phoneNumber': item.phoneNumber,
                  'bookingTimeId': item.bookingTimeId,
                  'startDate': item.startDate,
                  'endDate': item.endDate,
                  'tableId': item.tableId,
                  'createdDate': item.createdDate,
                  'updatedDate': item.updatedDate
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookingInfoEntity> _bookingInfoEntityInsertionAdapter;

  final UpdateAdapter<BookingInfoEntity> _bookingInfoEntityUpdateAdapter;

  final DeletionAdapter<BookingInfoEntity> _bookingInfoEntityDeletionAdapter;

  @override
  Stream<List<BookingInfoEntity>> getBookings() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM BookingInfoEntity ORDER BY startDate DESC',
        mapper: (Map<String, Object?> row) => BookingInfoEntity(
            row['id'] as int?,
            row['firstName'] as String,
            row['lastName'] as String,
            row['email'] as String,
            row['phoneNumber'] as String,
            row['bookingTimeId'] as int,
            row['startDate'] as int,
            row['endDate'] as int,
            row['tableId'] as int,
            row['createdDate'] as int,
            row['updatedDate'] as int),
        queryableName: 'BookingInfoEntity',
        isView: false);
  }

  @override
  Stream<List<BookingInfoView>> getBookingViews() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM BookingInfoView ORDER BY startDate DESC',
        mapper: (Map<String, Object?> row) => BookingInfoView(
            row['id'] as int?,
            row['firstName'] as String,
            row['lastName'] as String,
            row['email'] as String,
            row['phoneNumber'] as String,
            row['bookingTimeId'] as int,
            row['startDate'] as int,
            row['endDate'] as int,
            row['tableId'] as int,
            row['createdDate'] as int,
            row['updatedDate'] as int,
            row['tableName'] as String),
        queryableName: 'BookingInfoView',
        isView: true);
  }

  @override
  Future<BookingInfoEntity?> getBookingById(int id) async {
    return _queryAdapter.query('SELECT * FROM BookingInfoEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => BookingInfoEntity(
            row['id'] as int?,
            row['firstName'] as String,
            row['lastName'] as String,
            row['email'] as String,
            row['phoneNumber'] as String,
            row['bookingTimeId'] as int,
            row['startDate'] as int,
            row['endDate'] as int,
            row['tableId'] as int,
            row['createdDate'] as int,
            row['updatedDate'] as int),
        arguments: [id]);
  }

  @override
  Future<BookingInfoView?> getBookingViewById(int id) async {
    return _queryAdapter.query('SELECT * FROM BookingInfoView WHERE id = ?1',
        mapper: (Map<String, Object?> row) => BookingInfoView(
            row['id'] as int?,
            row['firstName'] as String,
            row['lastName'] as String,
            row['email'] as String,
            row['phoneNumber'] as String,
            row['bookingTimeId'] as int,
            row['startDate'] as int,
            row['endDate'] as int,
            row['tableId'] as int,
            row['createdDate'] as int,
            row['updatedDate'] as int,
            row['tableName'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insert(BookingInfoEntity bookingInfo) async {
    await _bookingInfoEntityInsertionAdapter.insert(
        bookingInfo, OnConflictStrategy.replace);
  }

  @override
  Future<void> _update(BookingInfoEntity bookingInfo) async {
    await _bookingInfoEntityUpdateAdapter.update(
        bookingInfo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(BookingInfoEntity bookingInfo) async {
    await _bookingInfoEntityDeletionAdapter.delete(bookingInfo);
  }
}

class _$BookingTimeDao extends BookingTimeDao {
  _$BookingTimeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookingTimeEntityInsertionAdapter = InsertionAdapter(
            database,
            'BookingTimeEntity',
            (BookingTimeEntity item) => <String, Object?>{
                  'id': item.id,
                  'startTime': item.startTime,
                  'endTime': item.endTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookingTimeEntity> _bookingTimeEntityInsertionAdapter;

  @override
  Future<List<BookingTimeView>> getAvailableBookingTime(int tableId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BookingTimeView btv WHERE id NOT IN (SELECT bookingTimeId FROM BookingInfoEntity WHERE startDate >= strftime(\'%s\', \'now\') AND tableId = ?1)AND btv.startDate >= cast(strftime(\'%s\', \'now\') as INT)',
        mapper: (Map<String, Object?> row) => BookingTimeView(row['id'] as int, row['startTime'] as String, row['endTime'] as String, row['startDate'] as int, row['endDate'] as int),
        arguments: [tableId]);
  }

  @override
  Future<void> insert(List<BookingTimeEntity> bookingTimes) async {
    await _bookingTimeEntityInsertionAdapter.insertList(
        bookingTimes, OnConflictStrategy.replace);
  }
}
