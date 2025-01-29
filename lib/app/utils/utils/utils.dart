import 'package:auto_route/auto_route.dart';
import 'package:flutter_base_kit/app/utils/extensions/string_extension.dart';
import 'package:flutter_base_kit/app/widgets/alert_dialog/adaptive_alert_dialog.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class WidgetUtils {
  static Future<void> showDefaultErrorDialog(
    BuildContext context,
    String errorMessage,
  ) async {
    final List<Widget> actionBuilders = [
      TextButton(
        onPressed: () {
          context.router.maybePop();
        },
        child: Text(S.current.ok.capitalize()),
      ),
    ];
    if (context.mounted) {
      return showAdaptiveDialog<void>(
        context: context,
        builder: (context) => AdaptiveAlertDialog(
          errorMessage: errorMessage,
          actionBuilders: actionBuilders,
        ),
      );
    }
  }
}
