import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../utils/constants/api_cache_database_keys.dart';

class LocalDataBase {
  LocalDataBase._();

  static final _singleTone = LocalDataBase._();

  static LocalDataBase get getInstance => _singleTone;

  final Completer<Database> _dbOpenCompleter = Completer();

  Future<Database> get database async {
    if (!_dbOpenCompleter.isCompleted) {

       _openDatabase();
    }

    return _dbOpenCompleter.future;
  }

  void _openDatabase()  async {

    // Gets application cache directory
    final dir = await getApplicationCacheDirectory();
    // Makes sure that directory exists
    await dir.create(recursive: true);

    final dbPath = '${dir.path}${cachedApisDatabaseKeys.dataBasePath}';

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }


}