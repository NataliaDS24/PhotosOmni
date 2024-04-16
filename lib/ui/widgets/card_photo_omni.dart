import 'package:photos_omni/config/config_imports.dart';
import 'package:photos_omni/models/photo_omni.dart';
import 'package:flutter/material.dart';

class CardPhotoOmni extends StatelessWidget {
  final PhotoOmni photoOmni;
  const CardPhotoOmni({
    super.key,
    required this.photoOmni,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: AppColors.floralLinen,
      ),
      child: Column(
        children: [
          Text(
            photoOmni.title,
            style: AppTextStyles.blackInterBold18,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.white,
                width: 10,
              ),
            ),
            child: Image.network(
              photoOmni.url,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
