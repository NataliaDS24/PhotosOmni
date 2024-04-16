import 'package:photos_omni/config/config_imports.dart';
import 'package:photos_omni/config/env.dart';
import 'package:photos_omni/data/api_helper/api_const.dart';
import 'package:photos_omni/models/photo_omni.dart';
import 'package:photos_omni/models/response_elements_repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PhotoOmniApiRepository {
  factory PhotoOmniApiRepository() {
    return _singleton;
  }

  PhotoOmniApiRepository._internal();

  static final PhotoOmniApiRepository _singleton =
      PhotoOmniApiRepository._internal();

  Future<ResponseElementsRepo> getAllPhotosOmni({required int page}) async {
    List<PhotoOmni> listPhotos = [];
    try {
      final url = Uri.https(
        Env.baseUrl,
        ApiConst.photos,
        {
          '_page': '$page',
          '_limit': '10',
        },
      );
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body) as List;
        for (var photo in body) {
          listPhotos.add(
            PhotoOmni.fromMap(map: photo),
          );
        }
      }
      return ResponseElementsRepo.success(
        AppStrings.loadingData,
        listPhotos,
      );
    } catch (e) {
      return ResponseElementsRepo.failed(
        AppStrings.errorData,
        listPhotos,
      );
    }
  }
}
