import 'package:flutter_base_kit/app/utils/mixins/error_handling_mixin.dart';
import 'package:flutter_base_kit/app/viewmodels/app_config_vm/theme_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

abstract class BaseStatefulState<Screen extends BaseStatefulPage> extends State<Screen> with ErrorHandlingMixin {
  PreferredSizeWidget? appbar() => null;

  Widget body();

  Widget? floatingActionButton() => null;

  EdgeInsets defaultPadding() => const EdgeInsets.all(StylesManager.defaultPadding);

  Color backgroundColor() => context.theme.scaffoldBackgroundColor;

  bool topSafeAreaEnabled() => true;

  bool bottomSafeAreaEnabled() => true;

  bool hasDefaultPadding() => true;

  /// Each Page are meant to be build with a [Scaffold] structure
  /// include with [AppBar], [Body], [FloatingActionButton]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      appBar: appbar(),
      body: SafeArea(
        left: false,
        right: false,
        top: hasDefaultPadding() ? topSafeAreaEnabled() : false,
        bottom: hasDefaultPadding() ? bottomSafeAreaEnabled() : false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: hasDefaultPadding() ? defaultPadding() : EdgeInsets.all(0),
            child: body(),
          ),
        ),
      ),
      floatingActionButton: floatingActionButton(),
    );
  }
}
