import 'package:photos_omni/config/config_imports.dart';
import 'package:photos_omni/config/router/router_path.dart';
import 'package:photos_omni/main_provider.dart';
import 'package:photos_omni/ui/screens/home/home_provider.dart';
import 'package:photos_omni/ui/screens/home/home_screen.dart';
import 'package:photos_omni/ui/screens/splash/splash_provider.dart';
import 'package:photos_omni/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (context) => SplashProvider(
            context: context,
          ),
          child: const SplashScreen(),
        ),
      );
    case AppRoutes.home:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (context) {
            final mainProvider = context.read<MainProvider>();
            return HomeProvider(
              mainProvider: mainProvider,
            );
          },
          child: const HomeScreen(),
        ),
      );
    default:
      return _errorRoute();
  }
}

MaterialPageRoute _buildRoute({
  required RouteSettings settings,
  required Widget builder,
}) {
  return MaterialPageRoute(
    settings: settings,
    maintainState: true,
    builder: (_) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.primary,
      ),
      child: builder,
    ),
  );
}

// Route for the case where the route was not found
Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text(
            AppStrings.pathError,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.pathError,
          ),
        ),
      );
    },
  );
}
