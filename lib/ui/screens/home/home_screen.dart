import 'package:photos_omni/config/config_imports.dart';
import 'package:photos_omni/ui/screens/home/home_provider.dart';
import 'package:photos_omni/ui/widgets/appbar_home.dart';
import 'package:photos_omni/ui/widgets/card_photo_omni.dart';
import 'package:photos_omni/ui/widgets/loading_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: const AppBarHome(),
      body: provider.isLoading
          ? const LoadingDataWidget()
          : provider.listPhotosOmni.isEmpty
              ? const Center(
                  child: Text(
                    AppStrings.notPhotos,
                    style: AppTextStyles.primaryInterSemiBold20,
                  ),
                )
              : ListView.builder(
                  controller: provider.controller,
                  itemCount: provider.listPhotosOmni.length,
                  itemBuilder: (context, index) => CardPhotoOmni(
                    photoOmni: provider.listPhotosOmni[index],
                  ),
                ),
    );
  }
}
