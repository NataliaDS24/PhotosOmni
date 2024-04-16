import 'package:photos_omni/config/env.dart';
import 'package:photos_omni/main.dart';

void main() async {
  Env.environment = Environment.development;
  await runPhotosOmni();
}
