import 'package:flutter_base_kit/app/viewmodels/app_config_vm/locale_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/app_config_vm/theme_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/base_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Configure Supabase URL and Key
const SUPABASE_URL = 'https://nwqqgzcyvmzbxolzuyei.supabase.co';
const SUPABASE_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53cXFnemN5dm16YnhvbHp1eWVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY2MjE4OTgsImV4cCI6MjA1MjE5Nzg5OH0.RYGWJ219DGuPKl3EVBHQw26pahc_7XErx7bMRTnvFX4';

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider(create: (_) => BaseViewModel()),
      ChangeNotifierProvider(create: (_) => LocaleViewModel()),
      ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ChangeNotifierProvider(create: (_) => UserViewModel()),
    ];
