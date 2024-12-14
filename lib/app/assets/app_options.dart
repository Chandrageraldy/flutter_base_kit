import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:flutter_base_kit/app/viewmodel/base_view_model.dart';
import 'package:flutter_base_kit/app/viewmodel/config/locale_view_model.dart';
import 'package:flutter_base_kit/app/viewmodel/config/theme_view_model.dart';

class APIConstant {
  static const String API_ENDPOINT = '';
}

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider(create: (_) => BaseViewModel()),
      ChangeNotifierProvider(create: (_) => LocaleViewModel()),
      ChangeNotifierProvider(create: (_) => ThemeViewModel()),
    ];
