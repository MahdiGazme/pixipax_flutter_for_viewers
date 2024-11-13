import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:milky_http_client/milky_http_client.dart';
import '../../shared/repository/avatar_repository.dart';

class AvatarSelectorHandler {
  final _repository = AvatarRepository();

  final String? avatarId;

  final RxBool showLoading = false.obs;

  AvatarSelectorHandler({
    this.avatarId,
  });

  //TODO: change getter after new parameters added
  String? get src => avatarId;

  Future<String?> onAvatarSelected(final FormData data) {
    showLoading.value = true;
    return _uploadAvatar(data);
  }

  Future<String?> _uploadAvatar(final FormData data) async {
    final resultOrException = await _repository.uploadAvatar(data);

    return resultOrException.fold(
      (final exception) {
        showLoading.value = false;
        return null;
      },
      (final result) {
        showLoading.value = false;
        return result.avatarUrl;
      },
    );
  }
}
