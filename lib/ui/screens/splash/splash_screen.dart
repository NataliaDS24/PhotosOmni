import 'package:photos_omni/ui/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:photos_omni/config/config_imports.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = context.read<SplashProvider>();
    return const Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppTextStyles.primaryInterBold40,
        ),
      ),
    );
  }
}
