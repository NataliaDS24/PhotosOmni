import 'package:photos_omni/config/config_imports.dart';

class ResponseElementsRepo {
  final String message;
  final bool status;
  final List<dynamic> listElements;

  const ResponseElementsRepo({
    this.message = AppStrings.voidText,
    this.status = false,
    this.listElements = const [],
  });

  factory ResponseElementsRepo.success(
    String message,
    List<dynamic> listElements,
  ) =>
      ResponseElementsRepo(
        message: message,
        status: true,
        listElements: listElements,
      );

  factory ResponseElementsRepo.failed(
    String message,
    List<dynamic> listElements,
  ) =>
      ResponseElementsRepo(
        message: message,
        status: false,
        listElements: listElements,
      );
}
