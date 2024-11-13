import 'package:get/get.dart';
import 'package:signature/signature.dart';
import '../models/dto/signature_points_dto.dart';
import '../repository/electronic_signature_page_repository.dart';

class ElectronicSignaturePageController extends GetxController {
  final ElectronicSignaturePageRepository _repository;

  late SignatureController signatureController;

  late double padSize;

  ElectronicSignaturePageController(
    this._repository,
  );

  void onSketchClear() => signatureController.clear();

  void onSignatureCompleted() async {
    if (signatureController.points.isNotEmpty) {
      final data = _createSignatureDto();
      final resultOrException = await _repository.postPoints(data);

      //TODO: handle Result Or Exception
      resultOrException.fold(
        (final exception) {
          Get.snackbar('Success', 'Signature uploaded successfully');
          signatureController.clear();
        },
        (final result) {
          signatureController.clear();
        },
      );
    }
  }

  SignaturePointsDto _createSignatureDto() => SignaturePointsDto(
        points: signatureController.points,
        padSize: padSize,
      );
}
