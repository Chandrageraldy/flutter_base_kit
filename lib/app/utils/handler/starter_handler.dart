import 'package:flutter_base_kit/app/assets/app_options/app_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHandler().initialize();
  await Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_KEY);
}
