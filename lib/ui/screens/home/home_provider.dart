import 'package:photos_omni/main_provider.dart';
import 'package:photos_omni/models/photo_omni.dart';
import 'package:flutter/material.dart';
import 'package:photos_omni/data/repositories/photos_api_repository.dart';
import 'package:photos_omni/utils/snackbar_utils.dart';

class HomeProvider extends ChangeNotifier {
  final MainProvider mainProvider;
  HomeProvider({
    required this.mainProvider,
  }) {
    getPhotos();
    controller.addListener(_scrollListener);
  }

  final PhotoOmniApiRepository photoOmniApiRepository =
      PhotoOmniApiRepository();
  ScrollController controller = ScrollController();
  List<PhotoOmni> listPhotosOmni = [];
  bool isLoading = true;
  int page = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      getPhotos();
    }
  }

  Future<void> getPhotos() async {
    final response = await photoOmniApiRepository.getAllPhotosOmni(
      page: page,
    );
    if (response.status) {
      final listPhotosResponse = response.listElements as List<PhotoOmni>;
      if (listPhotosResponse.isEmpty) {
        controller.removeListener(_scrollListener);
        return;
      }
      if (page == 1) {
        listPhotosOmni = listPhotosResponse;
      } else {
        mainProvider.mainScaffoldMessengerKey.currentState!.showSnackBar(
          SnackBarUtils.successAlert(
            message: response.message,
          ),
        );
        listPhotosOmni.addAll(listPhotosResponse);
      }
      page++;
      isLoading = false;
    } else {
      mainProvider.mainScaffoldMessengerKey.currentState!.showSnackBar(
        SnackBarUtils.errorAlert(
          message: response.message,
        ),
      );
    }

    notifyListeners();
  }

  Future<void> changeLoading(bool loading) async {
    isLoading = loading;
    notifyListeners();
  }
}
