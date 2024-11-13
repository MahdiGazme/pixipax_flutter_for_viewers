import 'package:sembast/sembast.dart';

import '../../shared/enums/cached_apis_status_enum.dart';
import '../../shared/models/dto/request_date_dto.dart';
import '../../shared/models/request_date_view_model.dart';
import '../utils/constants/api_cache_database_keys.dart';
import 'local_data_base.dart';

class CachedApiDao {
  final _apiStore = StoreRef<int, Map<String, dynamic>>(
    cachedApisDatabaseKeys.cachedApisStoreName,
  );

  Future<Database> get _db async => LocalDataBase.getInstance.database;

  Future<void> insertApi(final RequestDateDto request) async {
    await _apiStore.add(
      await _db,
      request.toJson(),
    );
  }

  Future<void> updateApi(
      final int requestId, final RequestDateDto request) async {
    await _apiStore.update(
      await _db,
      request.toJson(),
      finder: Finder(filter: Filter.byKey(requestId)),
    );
  }

  Future<void> deleteApi(final int requestId) async {
    await _apiStore.delete(
      await _db,
      finder: Finder(
        filter: Filter.byKey(requestId),
      ),
    );
  }

  Future<List<RequestDateViewModel>> getAllPendingApis() async {
    final finder = Finder(
      filter: Filter.equals(
        cachedApisDatabaseKeys.statusFilterKey,
        CachedApisStatusEnum.pending.status,
      ),
    );

    final apis = await _apiStore.find(
      await _db,
      finder: finder,
    );

    return apis
        .map(
          (final element) => RequestDateViewModel.fromJson(
            id: element.key,
            json: element.value,
          ),
        )
        .toList();
  }
}
