import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';

/// Function to perform all initial configuration based on running environment
/// Any method, feature that requires to init()/start() before app running, may do it here
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHandler().initialize();
}
