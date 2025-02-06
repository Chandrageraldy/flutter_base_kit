import 'package:flutter_base_kit/app/viewmodels/app_config_vm/locale_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/app_config_vm/theme_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/base_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Configure Supabase URL and Key
const SUPABASE_URL = '';
const SUPABASE_KEY = '';

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider(create: (_) => BaseViewModel()),
      ChangeNotifierProvider(create: (_) => LocaleViewModel()),
      ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ChangeNotifierProvider(create: (_) => UserViewModel()),
    ];
