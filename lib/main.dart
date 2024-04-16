import 'package:photos_omni/config/env.dart';
import 'package:photos_omni/config/router/router_path.dart';
import 'package:photos_omni/config/strings.dart';
import 'package:photos_omni/config/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photos_omni/config/router/router.dart' as router;
import 'package:photos_omni/main_provider.dart';
import 'package:provider/provider.dart';

Future<void> runPhotosOmni() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Env.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MainProvider mainProvider = MainProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: mainProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeDataApp.themeData,
        initialRoute: AppRoutes.splash,
        scaffoldMessengerKey: mainProvider.mainScaffoldMessengerKey,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
